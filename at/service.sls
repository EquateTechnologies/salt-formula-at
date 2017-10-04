# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "at/map.jinja" import at_settings with context %}

at.service:
{% if 'enabled' not in at_settings or ( 'enabled' in at_settings and at_settings.enabled ) %}
  service.running:
    - name: {{ at_settings.service }}
    - enable: True
{% else %}
  service.dead:
    - name: {{ at_settings.service }}
    - enable: False
{% endif %}
