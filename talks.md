---
layout: default
title: Talking | Rich Codes
---

<div id="articles">
  <h1 class="pageTitle">Talking</h1>
  <ul class="posts noList">
    {% assign sorted_talks = site.talks | sort: 'date' | reverse %}
    {% for talk in sorted_talks %}
      <li>
        <span class="date">{{ talk.date | date_to_string }}</span>
        <h3 id="{{ talk.title | slugify }}">{{ talk.title }}</h3>
        <p>
          {% if talk.audio_url %}
            <a href="{{ talk.audio_url }}" target="_blank">🎧 Hear it</a>
          {% endif %}
          {% if talk.slides_url %}
            <a href="{{ talk.video_url }}" target="_blank">🖥️ Watch it</a>
          {% endif %}
          <span style="display:inline-block;width: 5px"></span>
          {% if talk.slides_url %}
            <a href="{{ talk.slides_url }}" target="_blank">🃏 Presentation slides</a>
          {% endif %}
        </p>
        <p class="description">{{ talk.description }}</p>

        {% if talk.slides_url %}
          <div class="embedded-video">
            <iframe src="{{ talk.video_url }}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
</div>
