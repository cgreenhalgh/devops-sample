{% from "nagios/map.jinja" import nagios with context %}

include:
  - nagios.server

/etc/nagios/objects.salt:
  file.recurse:
    - source: salt://nagios/files/objects
    - user: nagios
    - group: nagios
    - file_mode: 444
    - dir_mode: 755
    - watch_in:
      - service: {{ nagios.service }}

