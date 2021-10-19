---
layout: default
title: Talks
---

<div id="articles">
  <h1 class="pageTitle">Talks</h1>
  <ul class="posts noList">
    {% assign sorted_talks = site.talks | sort: 'date' | reverse %}
    {% for talk in sorted_talks %}
      <li>
        <span class="date">{{ talk.date | date_to_string }}</span>
        <h3>{{ talk.title }}</h3>
        <p>
          <a href="{{ talk.video_url }}" target="_blank"><span class="dark-safe">🖥️</span> Watch it</a>
          <span style="display:inline-block;width: 5px"></span>
          <a href="{{ talk.slides_url }}" target="_blank"><span class="dark-safe">🃏</span> Presentation slides</a>
        </p>
        <p class="description">{{ talk.description }}</p>
        <div class="embedded-video">
          <iframe src="{{ talk.video_url }}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
      </li>
    {% endfor %}
  </ul>
</div>
