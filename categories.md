---
layout: page
title: Category
description: All post entries ordered by categories.
---

    {% assign tags = site.categories | sort %}
    {% assign sorted_posts = site.posts | sort: 'title' %}

  <div>
    {% for tag in tags %}
    <a href="#{{ tag | first | slugify }}">{{ tag | first | replace: '-', ' ' }} <span class="badge badge-pill badge-dark">{{ tag | last | size }}</span></a>{% endfor %}
  </div>

  {% for tag in tags %}
  <p><a name="{{ tag | first | slugify }}"></a>&nbsp;</p>
  <h3 class="archivetitle">
    <span>
      <i class="fa fa-tag" aria-hidden="true"></i>
    </span>
    <span>
      {{ tag | first | replace:'-', ' ' }}
    </span>
    <span class="badge badge-pill badge-dark">{{ tag | last | size }}</span>
  </h3>

  <ul>
    {% for post in sorted_posts %}
    {% if post.categories contains tag[0] %}
    <li><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a> {% if post.date %} <span class="badge badge-pill badge-info">{{ post.date | date: "%B %e, %Y" }}</span>{% endif %}</li>
    {% endif %}
    {% endfor %}
  </ul>
  {% endfor %}