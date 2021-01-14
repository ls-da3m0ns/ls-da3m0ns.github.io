---
title: "Kubernetes Introduction"
date: 2021-01-14
categories: Linux
description: "Everything about Kubenetes and its working in detail"
header:
    overlay_image: "/assets/images/posts/blog_11/image1.png"
---

With this article I am starting a new series of blog about kubernetes I will be going in detail about kubernetes and will also deploy lots of projects and demos
all the theoretical knowledge will be followed by sample code. 

So Lets Start 

<b>What the heck is kubernetes?</b>

Before we understand kubernetes we should first ask <u>why its is used</u> and the answer to that in simple words is to manage containers. 

<b>But what is this container ?</b>

Containers are similar to Virtual Machines (VMs) but not as isolated like VMs while VMs enjoy compelete isolation from base OS
containers use base OS to make themselves lightweight but only to a extent where they are still potable.
Similar to VMs Containers have there own filesystem, share of CPU, memory, process space. 

<u>So in lot more simple way containers give you a full fledge VM like environment but faster and less resource hungry.</u>

There are lots of container services but one of them which is famous for many good reasons is Docker

<b>Now lets comeback to our main question what is kubernetes?</b>

Although containers are great way to deploy your application but in production you need a way to easily manage these containers and ensure there is no downtime 
this is where services like kubernetes and other container-Orchestration tools comes in Kubernetes provides you with a framework to run distributed systems resiliently
in simpler words It takes care of scaling and failover for your application and can even help you with your deployment pattern.
	
<b>Services Provided By Kubernetes : </b>
	
	Service discovery and load balancing
	Storage Orchestration 
	Automated rollouts and rollbacks
	Automatic bin packing
	self healing
	Secret and configuration Management


Don't worry if you dont understand any of the above services we will learn each of them in detail in comming articles

<b>Myth regarding kubernetes </b>
It is a PaaS

this is one of the biggest myth in many users mind that kubernetes can operate on hardware level but thats not true it operates on container level 
But still it can provide some of the common PaaS offerings Such as Load Balancing, Deployment, Scaling, logging, monitoring etc