---
title: "Tensorflow TPU and TFrecords"
date: 2021-01-27
categories: ML
description: "Learn How to use TPU paired with TFrecords and speed up your model development"
header:
    overlay_image: "/assets/images/posts/blog_12/image1.png"
---


Before I start let me first say this "TPUs are fast and with fast i mean crazy fast the biggest bottleneck for TPU is its data loading process"

This article will be focused on how to combine TFrecod format with TPU processing to optimize data loading and minimize the training time

## There are Five major steps to keep in mind when you are using TPU in Tensorflow

* ####  TPU initialization
* ####  Distribution Strategy 
* ####  Data Type
* ####  Data loading 
* ####  Training 



## TPU initialization

Lets Start with TPU initialization, Its a very simple process and very important one the reason for this step is because TPU's are multi node workers in the Cloud you dont have 
direct access to them like you have with GPU's and CPU's so you need to initialize network connection to each TPU processing node.

Below is an Example code to do so

```
tpu = tf.distribute.cluster_resolver.TPUClusterResolver()
tf.config.experimental_connect_to_cluster(tpu)
tf.tpu.experimental.initialize_tpu_system(tpu)
```

## Distribution Strategy

Now as there are multiple devices to work with you need some distribution strategy so that you can take advantage of multiple processing nodes the concept of distribution strategy is similar to what you might use for multi GPU training 

[Read More about distributed training here](https://www.tensorflow.org/guide/distributed_training)

```
# instantiate a distribution strategy
tpu_strategy = tf.distribute.experimental.TPUStrategy(tpu)
AUTO = tf.data.experimental.AUTOTUNE
REPLICAS = tpu_strategy.num_replicas_in_sync
print(f'REPLICAS: {REPLICAS}')

```

## Data Type
Currently, only the tf.float32, tf.int32, tf.bfloat16, and tf.bool data types are supported on the TPU. Other common data types, such as tf.uint8, tf.string, and tf.int64, must be converted to one of the supported data types during data pre-processing. I mostly use float32 and personally never tried bfloat32 before but it should work just fine.

## Data Loading 
This is by far the most important step in TPU training correct implementation can give you huge perfomance boost.

### Tensorflow and TPU's only work with data hosted on GCS atleast for now

If you are using existing dataset from tensorflow dataset use ```try_gcs=True``` flag to load data from GCS other wise my recomendation is to host your data in tfrecord format in GCS buckets 
I personally use Kaggle to host dataset and get GCS path from kaggle kernel that's just me you can always use your personal GCP account

below is the example how i loaded Ranzcer competition dataset from gcs in tfrecord format 

**overview of code structure**

    select tfrecord files to be used for data loading in my case i had 15 tfrecord files
    load it using tf.data.TFRecordDataset api 
    then map functions to decode labels and images and then convert it to particular data type 
    finally before training configure perfomance optimizing and neccesary steps for example batch,prefetch,shuffle,repeat etc

```
def to_float32_2(image, label):
    max_val = tf.reduce_max(label, axis=-1,keepdims=True)
    cond = tf.equal(label, max_val)
    label = tf.where(cond, tf.ones_like(label), tf.zeros_like(label))
    return tf.cast(image, tf.float32), tf.cast(label, tf.int32)

def to_float32(image, label):
    return tf.cast(image, tf.float32), label

def decode_image(image_data):
    image = tf.image.decode_jpeg(image_data, channels=3)
    image = tf.cast(image, tf.float32) / 255.0  # convert image to floats in [0, 1] range
    image = tf.reshape(image, [1024,1024, 3]) # explicit size needed for TPU
    return image


def read_labeled_tfrecord(example):
    # Create a dictionary describing the features.
    LABELED_TFREC_FORMAT = {
        "StudyInstanceUID"           : tf.io.FixedLenFeature([], tf.string),
        "image"                      : tf.io.FixedLenFeature([], tf.string),
        "ETT - Abnormal"             : tf.io.FixedLenFeature([], tf.int64), 
        "ETT - Borderline"           : tf.io.FixedLenFeature([], tf.int64), 
        "ETT - Normal"               : tf.io.FixedLenFeature([], tf.int64), 
        "NGT - Abnormal"             : tf.io.FixedLenFeature([], tf.int64), 
        "NGT - Borderline"           : tf.io.FixedLenFeature([], tf.int64), 
        "NGT - Incompletely Imaged"  : tf.io.FixedLenFeature([], tf.int64), 
        "NGT - Normal"               : tf.io.FixedLenFeature([], tf.int64), 
        "CVC - Abnormal"             : tf.io.FixedLenFeature([], tf.int64), 
        "CVC - Borderline"           : tf.io.FixedLenFeature([], tf.int64), 
        "CVC - Normal"               : tf.io.FixedLenFeature([], tf.int64), 
        "Swan Ganz Catheter Present" : tf.io.FixedLenFeature([], tf.int64),
    }
    example = tf.io.parse_single_example(example, LABELED_TFREC_FORMAT)
    image = decode_image(example['image']) 
    image= tf.image.resize(image, [IMAGE_SIZE[0],IMAGE_SIZE[0]])
    uid= example["StudyInstanceUID"]
    cvca = example["CVC - Abnormal"]
    cvcb = example["CVC - Borderline"]
    cvcn = example["CVC - Normal"]
    etta = example["ETT - Abnormal"]
    ettb = example["ETT - Borderline"]
    ettn = example["ETT - Normal"]
    ngta = example["NGT - Abnormal"]
    ngtb = example["NGT - Borderline"]
    ngti = example["NGT - Incompletely Imaged"]
    ngtn = example["NGT - Normal"]
    sgcp = example["Swan Ganz Catheter Present"]

    label  = [etta, ettb, ettn, ngta, ngtb, ngti, ngtn,cvca, cvcb, cvcn , sgcp]
    label=[tf.cast(i,tf.float32) for i in label]
    return image,label # returns a dataset of (image, label) pairs

def read_unlabeled_tfrecord(example):
    UNLABELED_TFREC_FORMAT  = {
    "StudyInstanceUID" : tf.io.FixedLenFeature([], tf.string),
    "image" : tf.io.FixedLenFeature([], tf.string)
    }
    example = tf.io.parse_single_example(example, UNLABELED_TFREC_FORMAT)
    image = decode_image(example['image'])
    image= tf.image.resize(image, [IMAGE_SIZE[0],IMAGE_SIZE[0]])
    image_name = example['StudyInstanceUID']
    return image, image_name # returns a dataset of image(s)

def read_labeled_tf_record(filenames, labeled=True, ordered=False):
    ignore_order = tf.data.Options()
    if not ordered:
        ignore_order.experimental_deterministic = False # disable order, increase speed

    dataset = tf.data.TFRecordDataset(filenames, num_parallel_reads=AUTO) # automatically interleaves reads from multiple files
    dataset = dataset.with_options(ignore_order) # uses data as soon as it streams in, rather than in its original order
    dataset = dataset.map(read_labeled_tfrecord if labeled else read_unlabeled_tfrecord, num_parallel_calls=AUTO)
    return dataset

def data_augment(image, label):
    image = tf.image.random_flip_left_right(image , seed=SEED)
    image = tf.image.random_flip_up_down(image, seed=SEED)
    image = tf.image.random_brightness(image, max_delta=0.5) # Random brightness
    image = tf.image.random_saturation(image, 0, 2, seed=SEED)
    image = tf.image.adjust_saturation(image, 3)
    
    #image = tf.image.central_crop(image, central_fraction=0.5)
    return image, label   

def get_training_dataset(dataset):
    dataset = dataset.shuffle(2048)
    dataset = dataset.repeat() # the training dataset must repeat for several epochs
    dataset = dataset.map(data_augment, num_parallel_calls=AUTO)
    dataset = dataset.batch(BATCH_SIZE)
    dataset = dataset.prefetch(AUTO) # prefetch next batch while training (autotune prefetch buffer size)
    return dataset

def get_validation_dataset(ordered=False):
    dataset = load_dataset(VALIDATION_FILENAMES, labeled=True, ordered=ordered)
    dataset = dataset.batch(BATCH_SIZE)
    dataset = dataset.cache()
    dataset = dataset.prefetch(AUTO) # prefetch next batch while training (autotune prefetch buffer size)
    return dataset

def get_test_dataset(ordered=False):
    dataset = load_dataset(TEST_FILENAMES, labeled=False, ordered=ordered)
    dataset = dataset.batch(BATCH_SIZE)
    dataset = dataset.prefetch(AUTO) # prefetch next batch while training (autotune prefetch buffer size)
    return dataset

def load_dataset(filenames, labeled = True, ordered = False):
    ignore_order = tf.data.Options()
    
    if not ordered:
        ignore_order.experimental_deterministic = False
    
    dataset = (tf.data.TFRecordDataset(filenames, num_parallel_reads = AUTO).with_options(ignore_order).
               map(read_labeled_tfrecord if labeled else read_unlabeled_tfrecord, num_parallel_calls = AUTO))
    
    return dataset

training_filenames = []
training_filenames.append(GCS_DS_PATH + '/train_tfrecords/*.tfrec')
TRAINING_FILENAMES = tf.io.gfile.glob(training_filenames)

``` 

## Training

This is fairly easy stuff all you have do is to make sure what ever model or layers you are loading are hosted in GCS and model compilation should happen within the 
scope of distributed strategy

Example structure of code

```
def get_model():
    load_all your model layers 
    compile it here

with tpu_strategy.scope():
        model = get_model()

model.fit()
```

Thats It now you know how to make use of TPU's along with TFRecord format to get faster training 