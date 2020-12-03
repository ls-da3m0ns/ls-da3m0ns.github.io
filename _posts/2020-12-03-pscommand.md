---
title: "Why running ps command without options on shell shows only two entries"
date: 2020-12-03
header:
    overlay_image: "/assets/images/posts/blog_7/image1.png"
---
<b> What is ps command?</b>

ps also known as “Process status” is a command in linux which provides information about the current running process. ps command accepts several kinds of options like -

    UNIX option : which are always preceded by dash

    BSD options : which are not preceded by dash

    GNU options : which are preceded by double dash

<b>Why does ps only show 2 items?</b>

So when you run only “ps” command it only shows the process associated with the current terminal and with the same effective user id (euid) as that of the current user. In most cases it’s only two processes that run with that config but more processes can be created and displayed in ps command output.

To verify the same we can run a ping command from the current user and terminal then see the output of the “ps”, we will also verify the parent pid of the process.

{% include figure image_path="/assets/images/posts/blog_7/image1.png" %}

As you can see bash is the parent of both the process and the user is home.

<b>Common ways of using ps command</b>

ps can be paired with many arguments but some of them are more used than others those are

    ps -aux

This is perhaps the most widely used configuration of ps command as it lists detailed info of all the process of all the users on a system. Apart from the process associated with the terminal it also lists demons running in the background.

It can then be piped into other commands for more formatted and specific info like

    ps -aux | less


{% include figure image_path="/assets/images/posts/blog_7/image2.png" %}

    ps -elf

This is an alternative for viewing every process running in a system. It creates a table with 15 column.

{% include figure image_path="/assets/images/posts/blog_7/image3.png" %}

<b>From where does the “ps” command get all the info?</b>

ps command does not need any special permission like sudo because it reads the files present in /proc directory. The /proc directory is a special directory as it is the mount point of the proc filesystem which contains virtual files representing each process in the system with their pid as name.

{% include figure image_path="/assets/images/posts/blog_7/image4.png" %}