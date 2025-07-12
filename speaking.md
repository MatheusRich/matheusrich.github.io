---
layout: default
title: Speaking | Rich Codes
redirect_from:
  - /talking
  - /talks
---

<div id="articles">
  <h1 class="pageTitle">Speaking</h1>
  <ul class="posts noList">
    {% assign sorted_talks = site.talks | sort: 'date' | reverse %}
    {% for talk in sorted_talks %}
      <li>
        <span class="date">{{ talk.date | date_to_string }}</span>
        <h3 id="{{ talk.title | slugify }}">{{ talk.title }}</h3>
        <div class="flex gap-4">
          {% if talk.audio_url %}
            <a href="{{ talk.audio_url }}" target="_blank">🎧 Hear it</a>
          {% endif %}
          {% if talk.video_url %}
            <a href="{{ talk.video_url }}" target="_blank">🖥️ Watch it</a>
          {% endif %}
          {% if talk.slides_url %}
            <a href="{{ talk.slides_url }}" target="_blank">🃏 Presentation slides</a>
          {% endif %}
          {% if talk.event_url %}
            <a href="{{ talk.event_url }}" target="_blank">📅 Event</a>
          {% endif %}
        </div>
        <p class="description">{{ talk.description }}</p>

        {% if talk.video_url %}
          <div class="embedded-media embedded-video">
            <iframe src="{{ talk.video_url }}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
        {% elsif talk.embed %}
          <div class="embedded-media">
            {{ talk.embed }}
          </div>
        {% endif %}
      </li>
    {% endfor %}

  </ul>
</div>
