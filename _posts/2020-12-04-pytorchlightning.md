---
title: "Pytorch Lightning Transfer Learning on custom dataset"
date: 2020-12-04
categories: Linux ML
description: "Pytorch Lightning demystified,How to use Pytorch Lightning Transfer Learning on custom dataset"
header:
    overlay_image: "/assets/images/posts/blog_8/image1.png"
---
<b>Why use PyTorch Lightning when you already have PyTorch ?</b>

Although PyTorch is great but when task becomes complex there's lots of small mistakes that can happen this is where PyTorch Lightning shines it structures your training and preparation such thatits both extensible for advance users and easy to use for beginners


For this Blog we will be using Butterfly Dataset which contains images of 50 different classes of butterfly.

<b>Imports</b>

This is pretty straight forward and dose not require much explanation    

{% include figure image_path="/assets/images/posts/blog_8/image1.png" %}

<b>Dataset </b>

PyTorch Lightning has a clean way of handling data using classes, it has pre-built  hooks which automatically get attached to the required method of the class and also are customizable. 

{% include figure image_path="/assets/images/posts/blog_8/image2.png" %}

Few things to note here prepare_data function is called only once during training while function setup is called once for each device in the cluster.

Lets say you have 8 cores in a TPU then prepare_data would be called once (generally for downloading data ) then setup would be called once for each 8 cores 


<b>Model</b>

This is where most of the PyTorch lightning work is done, PyTorch lightning has preconfigured hooks that allows us train model carefree for example it automatically save checkpoint after each epoch, implements early_stopping if loss metrics is available and automatically setups device for you this allows us to run same code on CPU,GPU and also TPU 

{% include figure image_path="/assets/images/posts/blog_8/image3.png" %}

Here we are using ResNet50 for 50 classes and Adam optimizer with fixed learning rate of 1e-4


<b>Training</b>

Training is as simple as calling trainer.fit in PyTorch Lightning 

{% include figure image_path="/assets/images/posts/blog_8/image4.png" %}




