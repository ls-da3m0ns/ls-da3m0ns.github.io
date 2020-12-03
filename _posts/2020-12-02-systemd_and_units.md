---
classes: wide
layout: single
title:  "Systemd and Units"
date:   2020-12-02
categories: linux
header:
    overlay_image: "/assets/images/posts/blog_3/image1.png"
    caption: ""
    overlay_filter: "0.8"
---

What are units?

Units are basically resources that can be managed by systemctl, each unit is defined by unit files which are generally located in  <b>/lib/systemd/system</b>

To know more about systemctl refer to previous article at <mark><a href="https://medium.com/@backbencherspot/systemd-and-services-70db064e177d?source=friends_link&sk=5dcffa22d36815d0596f4e14553f5c08"> Link To Previous Article </a></mark>


{% include figure image_path="/assets/images/posts/blog_3/image1.png" caption="" %}

The type of unit is defined by the last part of unit file-name for example services have .service suffix

Note: we are not using sudo during execution of commands that’s because we are just read file info but not making any changes 

Systemd will only read or parse units which are necessary, it might not read every unit file in its directory so while listing units it only show files that are loaded into memory 


<b>Listing current units</b>

To list all the units that are currently active you can use list-units command

    systemctl  list-units 

Or 

    systemctl 

{% include figure image_path="/assets/images/posts/blog_3/image2.png" caption="" %}

To list all the units regardless of their current state you can use --all flag with it
    
    systemctl list-units --all

To list units of particular type you can use --type= filter for example to list all services unit 
    
    systemctl  list-units --type=service

{% include figure image_path="/assets/images/posts/blog_3/image3.png" caption="" %}


<b>Listing All unit files</b>

To list all unit files in the current directory of systemd we use list-unit-files command .

    systemctl list-unit-files

{% include figure image_path="/assets/images/posts/blog_3/image4.png" caption="" %}

The first thing to note here is that it contains a lot less information as compared to list-unit command. The reason is obvious: these are files which might not be loaded by systemd hence it only presents info about unit files.

<b>Displaying unit file of a service</b>

To get more specific information about a particular service we can use cat command to display its unit file
    
    systemctl cat apache2.service 

{% include figure image_path="/assets/images/posts/blog_3/image5.png" caption="" %}

<b>List dependencies of unit </b>

To list dependencies of a unit you can use list-dependencies command. It will output list of dependencies of unit which must be completed before starting that unit
 
{% include figure image_path="/assets/images/posts/blog_3/image6.png" caption="" %}

<b>Masking of units</b>

In the last article we saw how we can use systemctl enable/disable servicename command to enable or disable a service but systemd has the ability to make a unit completely unstartable by masking it. To mask a service use 

    sudo systemctl mask apache2.service

{% include figure image_path="/assets/images/posts/blog_3/image7.png" caption="" %}

This will make apache unstartable automatically or manually, If you want to again use service you will have to unmask the service first using 
    
    sudo systemctl unmask apache2.service



