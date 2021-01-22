---
layout: page
title: About
permalink: /about/
---

{% assign states = site.states | split: ", " %}
States:
{%- for s in states -%}
    a {{ s }} <br/>
{%- endfor -%}

## What this blog is 

- A demo by [kubeflow.party](https://kubeflow.party) showing how Kubeflow can create an automated blog to update people
with useful information
  
## What this blog is NOT

- Medical advice
- High quality statistical research
- Something you should consider with respect to getting vaccinated.
- A reason to get upset and send us flame messages.
