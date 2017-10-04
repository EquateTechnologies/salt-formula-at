# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "at/map.jinja" import at_settings with context %}

{% if 'jobs' in at_settings %}
{% for job,job_options in at_settings.jobs.iteritems() %}

at.{{ job }}:
    at.{{ job_options.type|default('present') }}:
        - job: '{{ job_options.job }}'
        {% if 'user' in job_options %}
        - user: {{ job_options.user|default('root') }}
        {% endif %}
        {% if 'timespec' in job_options %}
        - timespec: {{ job_options.timespec }}
        {% endif %}
        {% if 'unique_tag' in job_options and job_options.unique_tag %}
        - unique_tag: True
        {% endif %}
        {% if 'tag' in job_options %}
        - tag: '{{ job_options.tag }}'
        {% endif %}
{% endfor %}
{% endif %}

{% if 'use_allow' in at_settings and at_settings.use_allow and 'allow' in at_settings %}
/etc/at.allow:
  file.managed:
    - source: salt://at/files/at.allow
    - template: jinja
    - user: root
    - group: root
    - mode: 0600
{% endif %}

{% if 'use_deny' in at_settings and not at_settings.use_deny %}
/etc/at.deny:
  file.absent:
{% endif %}
