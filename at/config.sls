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
