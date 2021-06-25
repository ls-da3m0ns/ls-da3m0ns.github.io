---
title:  "Projects"
layout: archive
permalink: /Pages/
description: "Latest DevOps and Machine Learning Blogs With a bit of Data Science as well"
author_profile: true
comments: true
---

{% for post in site.pages %}
    {% if post.categories == "projects" %}
        {% include archive-single.html %}
    {%endif%}
{% endfor %}