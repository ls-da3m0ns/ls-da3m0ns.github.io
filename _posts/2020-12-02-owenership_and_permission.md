---
classes: wide
layout: single
title:  "Ownership and permissions in linux"
description: "Ownership and permissions demystified, How linux handles owenersip and permissions"
date:   2020-12-02
categories: linux
header:
    overlay_image: "/assets/images/posts/blog_1/image1.png"
    caption: ""
---

We all have at some point experienced permission denied error, isn’t it frustrating so let’s understand how permissions in linux work.

Linux like many other operating system is multi-user OS therefore to keep each users data safe and block unauthorized access linux enforces 2 level guard

    Ownership
    Permission

Before we talk about how to get information about files security , to get current info about files security permission you can use ls -al this list all files and directories in current directory with its permissions and ownership details

{% include figure image_path="/assets/images/posts/blog_1/image1.png" alt="ls command demo " caption="" %}


Let’s talk about Ownership of a file/directory

There are three types of owners

Owner : these permissions only apply to owner of a file/directory and not other users

Group : each file/directory is assigned a group, these permission affect all users in that group

Others : these are the permissions for all users which are not owner or part of group

Owner denotations

    u : user/owner

    g : group

    o : other

    a : all

Changing Ownership and Groups

To change the ownership of a file or a directory use 

    chown user’s-name filename

To change the group of a file or a directory use 

    chown group-name filename

{% include figure image_path="/assets/images/posts/blog_1/image2.png" alt="ls command demo " caption="" %}

To change both user and group at the same time use 

    chown user:group filename

Now let’s talk about file/directory permissions

So Permissions are generally represented through the use of the letters r, w and x but they can also be represented numerically.

The table below gives us number for all permission types


    Number      Permission Type         Symbol 

    0           No permission           ---
    1           execute                 --x
    2           write                   -w-
    3           write+execute           -wx
    4           read                    r--
    5           read+execute            r-x
    6           read+write              rw-
    7           read+write+execute      rwx



To change permission of a file/directory you can use

    chmod permissions file

{% include figure image_path="/assets/images/posts/blog_1/image3.png" alt="ls command demo " caption="" %}

In numeric mode you can change permission for all three types of user at once as each digit represents owner,group,others respectively.

While using symbolic mode you can change permission for specific user by using mathematical symbols

    +   To add a permission 
    -   To remove a permission
    =   To set new permission and override older ones


{% include figure image_path="/assets/images/posts/blog_1/image4.png" alt="ls command demo " caption="" %}
