<ul>
{% for item in site.pages %}
  {% if item.path contains 'microstreams/' %}
    <li>
      <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
      <span>— {{ item.date | date: "%Y-%m-%d %H:%M" }}</span>
    </li>
  {% endif %}
{% endfor %}
</ul>
