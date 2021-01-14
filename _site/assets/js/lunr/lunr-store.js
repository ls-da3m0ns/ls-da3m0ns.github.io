var store = [{
        "title": "Ownership and permissions in linux",
        "excerpt":"We all have at some point experienced permission denied error, isn’t it frustrating so let’s understand how permissions in linux work.   Linux like many other operating system is multi-user OS therefore to keep each users data safe and block unauthorized access linux enforces 2 level guard   Ownership Permission   Before we talk about how to get information about files security , to get current info about files security permission you can use ls -al this list all files and directories in current directory with its permissions and ownership details                     Let’s talk about Ownership of a file/directory   There are three types of owners   Owner : these permissions only apply to owner of a file/directory and not other users   Group : each file/directory is assigned a group, these permission affect all users in that group   Others : these are the permissions for all users which are not owner or part of group   Owner denotations   u : user/owner  g : group  o : other  a : all   Changing Ownership and Groups   To change the ownership of a file or a directory use   chown user’s-name filename   To change the group of a file or a directory use   chown group-name filename                     To change both user and group at the same time use   chown user:group filename   Now let’s talk about file/directory permissions   So Permissions are generally represented through the use of the letters r, w and x but they can also be represented numerically.   The table below gives us number for all permission types   Number      Permission Type         Symbol   0           No permission           --- 1           execute                 --x 2           write                   -w- 3           write+execute           -wx 4           read                    r-- 5           read+execute            r-x 6           read+write              rw- 7           read+write+execute      rwx   To change permission of a file/directory you can use   chmod permissions file                     In numeric mode you can change permission for all three types of user at once as each digit represents owner,group,others respectively.   While using symbolic mode you can change permission for specific user by using mathematical symbols   +   To add a permission  -   To remove a permission =   To set new permission and override older ones                     ","categories": ["linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/owenership_and_permission",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Systemd And Services",
        "excerpt":"What is systemd?   Systemd is a new Initialization system and service manager earlier initialization was done using something called SysVinit scripts but nowadays most of the linux distributions except few like Alpine, Gentoo have already shifted to systemd due to its simplicity and backwards compatibility with SysV.   To completely understand initialization system you would have to understand linux boot process   After BIOS completes hardware initialization it transfers control to bootloader.Bootloader then calls the kernel, Kernel loads initial RAM disks and looks for the root file system in system drives, once the kernel is set up it starts systemd initialization. Systemd is the first program called outside kernel space thus it has PID 1, systemd then prepares the userspace and brings OS to operational state by starting all other services.   What is systemctl ?   Systemctl is a tool to manage and control systemd service manager and init system. It helps executing tasks easily which otherwise would take a lot more time as it is easy to manage. Due to its wide adaptation it becomes necessary to get familiar with systemctl.   Managing services   Starting service   To start a service use start command with root previlages   sudo systemctl start servicename.service   You can also use syntax like as systemctl is smart enough to figure it out        Checking status of a service   To get current status of service you can use status command   systemctl status servicename.service   It gives a great overview of service with information like PID, first few line of logs and cgroup hierarchy        Stoping service   To stop a service you can use stop command   sudo systemctl stop servicename.service        Restarting and reloading service   To restart a service you can use restart command   sudo systemctl restart servicename.service   If service has capability to reload its config files then you can use reload command   sudo systemctl reload servicename.service   Enabling and Disabling Services   To automatically start a service while booting you can use enable command. This will create a symlink of unit file of service which systemd reads during initialization.   sudo systemctl enable servicename.service        Similarly to disable a service you can use disable command this will delete the symlink created earlier   sudo systemctl disable servicename.service        ","categories": ["linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/systemd_and_services",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Systemd and Units",
        "excerpt":"What are units?   Units are basically resources that can be managed by systemctl, each unit is defined by unit files which are generally located in  /lib/systemd/system   To know more about systemctl refer to previous article at  Link To Previous Article                      The type of unit is defined by the last part of unit file-name for example services have .service suffix   Note: we are not using sudo during execution of commands that’s because we are just read file info but not making any changes   Systemd will only read or parse units which are necessary, it might not read every unit file in its directory so while listing units it only show files that are loaded into memory   Listing current units   To list all the units that are currently active you can use list-units command   systemctl  list-units    Or   systemctl                      To list all the units regardless of their current state you can use –all flag with it   systemctl list-units --all   To list units of particular type you can use –type= filter for example to list all services unit   systemctl  list-units --type=service                     Listing All unit files   To list all unit files in the current directory of systemd we use list-unit-files command .   systemctl list-unit-files                     The first thing to note here is that it contains a lot less information as compared to list-unit command. The reason is obvious: these are files which might not be loaded by systemd hence it only presents info about unit files.   Displaying unit file of a service   To get more specific information about a particular service we can use cat command to display its unit file   systemctl cat apache2.service                      List dependencies of unit    To list dependencies of a unit you can use list-dependencies command. It will output list of dependencies of unit which must be completed before starting that unit                     Masking of units   In the last article we saw how we can use systemctl enable/disable servicename command to enable or disable a service but systemd has the ability to make a unit completely unstartable by masking it. To mask a service use   sudo systemctl mask apache2.service                     This will make apache unstartable automatically or manually, If you want to again use service you will have to unmask the service first using   sudo systemctl unmask apache2.service   ","categories": ["linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/systemd_and_units",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "What are L1,L2 and L3 cache",
        "excerpt":"Current generation Computer processors have processing speed of around 3Ghz, and while even high end RAM have speed of 2.4Ghz. As you can see this could be a huge bottle neck for Computers this problem is resolved by using something called CPU cache.   In Computers mainly there are two type of memory   DRAM (dynamic ram )   These use capacitors and because of that they need to be constantly refreshed using electricity. DRAMs are generally slower than SRAM. A great example of DRAM is RAM.   SRAM (static ram)   SRAM uses flip flop thus having greater speed and does not need to be refreshed constantly, but SRAM are more expensive than DRAM. They are generally used in CPU cache.   CPU cache is also called internal memory of CPU, it stores copies of data and instruction from RAM, CPU constantly needs files from RAM CPU cache acts as middle man and stores most frequently requested files by CPU thus increasing efficiency of processor.   There are three types of CPU cache L1(further split into L1d (data) and L1i (instruction) ) L2 and L3   In Linux based OS we can use lscpu command to get capacity of each type of cache        L1 cache   It is located on the processor and every processor has its own L1 cache. L1 cache is the fastest cache in the computer and runs at the same speed as that of the processor.   L1 cache is nowadays splitted between L1d (Data) and L1i (instruction)   L2 cache   L2 cache is also known as external cache, as the name suggests it is located outside the processor (core). It stores recent data accessed by CPU which are not stored in L1 cache. If the CPU can’t find data in L1 cache it looks in L2 cache.   L3 cache   L3 cache is also called shared cache as it is shared between all the processors. It stores recent data accessed by CPU which is not available in both L1 or L2 cache . If CPU doesn’t finds data here then it will have to request data from much slower memory RAM   How cache stores data   In every program, there are usually a few instructions that repeat again and again, whereas the rest are executed only once or twice. Those repeating part of code is sent straight to cache, But these codes lines are not consecutive so a “label” is assigned to each cache position, the label is equal to the position of that code line in the ROM. Hence when CPU ask for a code line   first requested ROM possition is compared with all the labels in the cache. If there is a match (also called cache hit) then associated code line from cache is extracted.   If there is no match (also called cache miss ) code is extracted from ROM, naturally in this case time taken will be more than usual.   also a new entry is created in cache for each miss, and to create this space least-recently used cache entry is deleted   Why CPU cache is faster?   Along side each cached line of memory there are extra memory cells that store part(or all ) of the address. therefore all the cells can be queried to see whether they have the particular line of memory that cpu wants and then data will dump it onto bus that connects the main memory to the processor core. this happens in less than a cycle, because it is much simpler  ","categories": ["linux","Linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/l1l2l3",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Use of O_SYNC flag while opening file",
        "excerpt":"Opening a file in Linux is generally done by the help of open( ) system call. The open( ) function establishes the connection between a file and a file descriptor. It will create an open file description that refers to a file and a file descriptor that refers to that open file description. The file descriptor is used by other I/O functions to refer to the file.   int open(const char *pathname, int flags, mode_t mode);   The function open( ) opens the file specified by pathname. If the specified file does not exist it may optionally be created by providing the O_CREAT flag in open( ). The argument flags must include one of the following access modes: O_RDONLY, O_WRONLY, or O_RDWR . These requests open the file in read-only, write-only, or read/write modes, respectively.   In addition, zero or more file creation flags and file status flags can be bitwise-or%u2019d in flags. The file creation flags affect the semantics of the open operation itself while the file status flag affects the semantics of subsequent I/O operations.    Bitwise-or of O_RDONLY and O_SYNC flag:   Synchronized I/O specifies the open() flags O_SYNC,O_DSYNC, and O_RSYNC for controlling the behaviour. Regardless of whether an implementation supports this option, it must at least support the use of O_SYSNC for regular files.   Linux implements O_SYNC and O_DSYNC, but not O_RSYNC. Somewhat incorrectly, glibc defines O_RSYNC to have the same value as O_SYNC.   O_SYNC provides synchronized I/O file integrity completion, meaning write operations will flush data and all associated metadata to the underlying hardware.   O_DSYNC provides synchronized I/O data integrity completion, meaning write operations will flush data to the underlying hardware, but will only flush metadata updates that are required to allow a subsequent read operation to complete successfully.   Data integrity completion can reduce the number of disk operations that are required for applications that don’t need the guarantees of file integrity completion.   Since Linux 2.6.33, proper O_SYNC support has been provided. However, to ensure backward binary compatibility, O_DSYNC was defined with the same value as the historical O_SYNC, and O_SYNC was defined as a new (two-bit) flag value that includes the O_DSYNC flag value.   This ensures that applications compiled against new headers get at least O_DSYNC semantics on pre-2.6.33 kernels.  ","categories": ["linux","Linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/osync",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Why running ps command without options on shell shows only two entries",
        "excerpt":" What is ps command?   ps also known as “Process status” is a command in linux which provides information about the current running process. ps command accepts several kinds of options like -   UNIX option : which are always preceded by dash  BSD options : which are not preceded by dash  GNU options : which are preceded by double dash   Why does ps only show 2 items?   So when you run only “ps” command it only shows the process associated with the current terminal and with the same effective user id (euid) as that of the current user. In most cases it’s only two processes that run with that config but more processes can be created and displayed in ps command output.   To verify the same we can run a ping command from the current user and terminal then see the output of the “ps”, we will also verify the parent pid of the process.        As you can see bash is the parent of both the process and the user is home.   Common ways of using ps command   ps can be paired with many arguments but some of them are more used than others those are   ps -aux   This is perhaps the most widely used configuration of ps command as it lists detailed info of all the process of all the users on a system. Apart from the process associated with the terminal it also lists demons running in the background.   It can then be piped into other commands for more formatted and specific info like   ps -aux | less        ps -elf   This is an alternative for viewing every process running in a system. It creates a table with 15 column.        From where does the “ps” command get all the info?   ps command does not need any special permission like sudo because it reads the files present in /proc directory. The /proc directory is a special directory as it is the mount point of the proc filesystem which contains virtual files representing each process in the system with their pid as name.       ","categories": ["linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/pscommand",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Deep Learning Approach in detecting Malware (STAMINA)",
        "excerpt":"Intel Labs and Microsoft Threat Protection Intelligence Teams are collaborating to research the application of deep learning for malware threat detection. Intel and Microsoft have previously demonstrated that transfer learning from computer vision for malware analysis can achieve highly desirable classification performance.   The companies call the project STAMINA. The main aim of STAMINA (STAtic Malware-as-image Network Analysis) is to Leverage Deep learning techniques to avoid time-consuming manual feature engineering with high accuracy and low false positives.   Static analysis is a quick and straightforward way to detect malware without executing the application or monitoring the run time behaviour, static analysis technique is used to match malicious signatures.        Preprocessing (image conversion)   An image is obtained from a binary application by assigning a value between 0–255 to every byte, which directly corresponds to pixel intensity. The resulting1-D pixel stream is then converted to 2-D with the help of a table shown below that gives width according to file size, height is obtained by no of pixels divided by width. After reshaping images are resized to 224 or 299 using bilinear interpolation or nearest neighbor algorithms.        Transfer learning Step   Due to limitation of datasets training a complete deep neural network can be difficult therefore transfer learning is used. The idea here is to borrow knowledge learned from a model used in one domain and apply it to another target domain.   A portion of layers are frozen and the last few layers are fine-tuned on a newly obtained dataset.        This approach of malware classification resulted in accuracy upto 99% with 2.6% false positive rating. While this technique is revolutionary it is still in early stages. It’s extremely effective in analyzing small files but with large binaries STAMINA lags . The joint research encourages the use of deep transfer learning for the purpose of malware classification.  ","categories": ["linux","ML"],
        "tags": [],
        "url": "http://localhost:4000/linux/ml/stamina",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Pytorch Lightning Transfer Learning on custom dataset",
        "excerpt":"Why use PyTorch Lightning when you already have PyTorch ?   Although PyTorch is great but when task becomes complex there’s lots of small mistakes that can happen this is where PyTorch Lightning shines it structures your training and preparation such thatits both extensible for advance users and easy to use for beginners   For this Blog we will be using Butterfly Dataset which contains images of 50 different classes of butterfly.   Imports   This is pretty straight forward and dose not require much explanation        Dataset    PyTorch Lightning has a clean way of handling data using classes, it has pre-built  hooks which automatically get attached to the required method of the class and also are customizable.        Few things to note here prepare_data function is called only once during training while function setup is called once for each device in the cluster.   Lets say you have 8 cores in a TPU then prepare_data would be called once (generally for downloading data ) then setup would be called once for each 8 cores   Model   This is where most of the PyTorch lightning work is done, PyTorch lightning has preconfigured hooks that allows us train model carefree for example it automatically save checkpoint after each epoch, implements early_stopping if loss metrics is available and automatically setups device for you this allows us to run same code on CPU,GPU and also TPU        Here we are using ResNet50 for 50 classes and Adam optimizer with fixed learning rate of 1e-4   Training   Training is as simple as calling trainer.fit in PyTorch Lightning        ","categories": ["linux","Linux","ML"],
        "tags": [],
        "url": "http://localhost:4000/linux/ml/pytorchlightning",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Top 0.1% EDA for metro-interstate-traffic-volume",
        "excerpt":"This is my approach to metro-interstate-traffic-volume major feature of this EDA is its Data Cleaning step while Modeling Step was pretty Straight forward and think this is where you guys can  improve and push the RMSE a bit lower.     ","categories": ["linux","ML"],
        "tags": [],
        "url": "http://localhost:4000/linux/ml/traffic_volume_prediction",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "100% accuracy on Fake News Classifiaction problem ",
        "excerpt":"This is my approach to fake news classification challenge, If You ask me this was prettyu basic competion the trick was one of the test case ehich had no content so as usual my approach was to get as much content so i merged title and content column and that got me to 100% accuracy.     ","categories": ["linux","ML"],
        "tags": [],
        "url": "http://localhost:4000/linux/ml/fake-news-detector",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      },{
        "title": "Kubernetes Introduction",
        "excerpt":"With this article I am starting a new series of blog about kubernetes I will be going in detail about kubernetes and will also deploy lots of projects and demos all the theoretical knowledge will be followed by sample code.   So Lets Start   What the heck is kubernetes?   Before we understand kubernetes we should first ask why its is used and the answer to that in simple words is to manage containers.   But what is this container ?   Containers are similar to Virtual Machines (VMs) but not as isolated like VMs while VMs enjoy compelete isolation from base OS containers use base OS to make themselves lightweight but only to a extent where they are still potable. Similar to VMs Containers have there own filesystem, share of CPU, memory, process space.   So in lot more simple way containers give you a full fledge VM like environment but faster and less resource hungry.   There are lots of container services but one of them which is famous for many good reasons is Docker   Now lets comeback to our main question what is kubernetes?   Although containers are great way to deploy your application but in production you need a way to easily manage these containers and ensure there is no downtime  this is where services like kubernetes and other container-Orchestration tools comes in Kubernetes provides you with a framework to run distributed systems resiliently in simpler words It takes care of scaling and failover for your application and can even help you with your deployment pattern.   Services Provided By Kubernetes :    Service discovery and load balancing Storage Orchestration  Automated rollouts and rollbacks Automatic bin packing self healing Secret and configuration Management   Don’t worry if you dont understand any of the above services we will learn each of them in detail in comming articles   Myth regarding kubernetes  It is a PaaS   this is one of the biggest myth in many users mind that kubernetes can operate on hardware level but thats not true it operates on container level  But still it can provide some of the common PaaS offerings Such as Load Balancing, Deployment, Scaling, logging, monitoring etc  ","categories": ["linux","Linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/kubernetes-introduction",
        "teaser": "http://localhost:4000/assets/images/default_overlay.png"
      }]
