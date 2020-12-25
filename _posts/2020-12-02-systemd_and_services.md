---
classes: wide
layout: single
title:  "Systemd And Services"
date:   2020-12-02
description: "Systemd And Services demystified, What is Systemd And Services"
categories: linux
header:
    overlay_image: "/assets/images/posts/blog_2/image1.png"
    caption: ""
---

What is systemd?

Systemd is a new Initialization system and service manager earlier initialization was done using something called SysVinit scripts but nowadays most of the linux distributions except few like Alpine, Gentoo have already shifted to systemd due to its simplicity and backwards compatibility with SysV.

To completely understand initialization system you would have to understand linux boot process

After BIOS completes hardware initialization it transfers control to bootloader.Bootloader then calls the kernel, Kernel loads initial RAM disks and looks for the root file system in system drives, once the kernel is set up it starts systemd initialization. Systemd is the first program called outside kernel space thus it has PID 1, systemd then prepares the userspace and brings OS to operational state by starting all other services.

What is systemctl ?

Systemctl is a tool to manage and control systemd service manager and init system. It helps executing tasks easily which otherwise would take a lot more time as it is easy to manage. Due to its wide adaptation it becomes necessary to get familiar with systemctl.

Managing services

Starting service

To start a service use start command with root previlages

    sudo systemctl start servicename.service

You can also use syntax like as systemctl is smart enough to figure it out

{% include figure image_path="/assets/images/posts/blog_2/image1.png" %}

Checking status of a service

To get current status of service you can use status command

    systemctl status servicename.service

It gives a great overview of service with information like PID, first few line of logs and cgroup hierarchy

{% include figure image_path="/assets/images/posts/blog_2/image2.png" %}

Stoping service

To stop a service you can use stop command

    sudo systemctl stop servicename.service

{% include figure image_path="/assets/images/posts/blog_2/image3.png" %}

Restarting and reloading service

To restart a service you can use restart command

    sudo systemctl restart servicename.service


If service has capability to reload its config files then you can use reload command

    sudo systemctl reload servicename.service

Enabling and Disabling Services

To automatically start a service while booting you can use enable command. This will create a symlink of unit file of service which systemd reads during initialization.

    sudo systemctl enable servicename.service


{% include figure image_path="/assets/images/posts/blog_2/image4.png" %}


Similarly to disable a service you can use disable command this will delete the symlink created earlier

    sudo systemctl disable servicename.service


{% include figure image_path="/assets/images/posts/blog_2/image5.png" %}
