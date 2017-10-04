# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "at/map.jinja" import at_settings with context %}

at.install:
  pkg.installed:
    - name: {{ at_settings.pkg }}
