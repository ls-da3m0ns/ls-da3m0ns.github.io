var store = [{
        "title": "My first post",
        "excerpt":"my first post looks just fine  ","categories": ["demo"],
        "tags": [],
        "url": "http://localhost:4000/demo/demopost",
        "teaser": "http://localhost:4000/assets/images/404.png"
      },{
        "title": "Ownership and permissions in linux",
        "excerpt":"We all have at some point experienced permission denied error, isn’t it frustrating so let’s understand how permissions in linux work.   Linux like many other operating system is multi-user OS therefore to keep each users data safe and block unauthorized access linux enforces 2 level guard   Ownership Permission   Before we talk about how to get information about files security , to get current info about files security permission you can use ls -al this list all files and directories in current directory with its permissions and ownership details                     Let’s talk about Ownership of a file/directory   There are three types of owners   Owner : these permissions only apply to owner of a file/directory and not other users   Group : each file/directory is assigned a group, these permission affect all users in that group   Others : these are the permissions for all users which are not owner or part of group   Owner denotations   u : user/owner  g : group  o : other  a : all   Changing Ownership and Groups   To change the ownership of a file or a directory use   chown user’s-name filename   To change the group of a file or a directory use   chown group-name filename                     To change both user and group at the same time use   chown user:group filename   Now let’s talk about file/directory permissions   So Permissions are generally represented through the use of the letters r, w and x but they can also be represented numerically.   The table below gives us number for all permission types   Number      Permission Type         Symbol   0           No permission           --- 1           execute                 --x 2           write                   -w- 3           write+execute           -wx 4           read                    r-- 5           read+execute            r-x 6           read+write              rw- 7           read+write+execute      rwx   To change permission of a file/directory you can use   chmod permissions file                     In numeric mode you can change permission for all three types of user at once as each digit represents owner,group,others respectively.   While using symbolic mode you can change permission for specific user by using mathematical symbols   +   To add a permission  -   To remove a permission =   To set new permission and override older ones                     ","categories": ["linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/owenership_and_permission",
        "teaser": "http://localhost:4000/assets/images/404.png"
      },{
        "title": "Systemd And Services",
        "excerpt":"What is systemd?   Systemd is a new Initialization system and service manager earlier initialization was done using something called SysVinit scripts but nowadays most of the linux distributions except few like Alpine, Gentoo have already shifted to systemd due to its simplicity and backwards compatibility with SysV.   To completely understand initialization system you would have to understand linux boot process   After BIOS completes hardware initialization it transfers control to bootloader.Bootloader then calls the kernel, Kernel loads initial RAM disks and looks for the root file system in system drives, once the kernel is set up it starts systemd initialization. Systemd is the first program called outside kernel space thus it has PID 1, systemd then prepares the userspace and brings OS to operational state by starting all other services.   What is systemctl ?   Systemctl is a tool to manage and control systemd service manager and init system. It helps executing tasks easily which otherwise would take a lot more time as it is easy to manage. Due to its wide adaptation it becomes necessary to get familiar with systemctl.   Managing services   Starting service   To start a service use start command with root previlages   sudo systemctl start servicename.service   You can also use syntax like as systemctl is smart enough to figure it out        Checking status of a service   To get current status of service you can use status command   systemctl status servicename.service   It gives a great overview of service with information like PID, first few line of logs and cgroup hierarchy        Stoping service   To stop a service you can use stop command   sudo systemctl stop servicename.service        Restarting and reloading service   To restart a service you can use restart command   sudo systemctl restart servicename.service   If service has capability to reload its config files then you can use reload command   sudo systemctl reload servicename.service   Enabling and Disabling Services   To automatically start a service while booting you can use enable command. This will create a symlink of unit file of service which systemd reads during initialization.   sudo systemctl enable servicename.service        Similarly to disable a service you can use disable command this will delete the symlink created earlier   sudo systemctl disable servicename.service        ","categories": ["linux"],
        "tags": [],
        "url": "http://localhost:4000/linux/systemd_and_services",
        "teaser": "http://localhost:4000/assets/images/404.png"
      }]
