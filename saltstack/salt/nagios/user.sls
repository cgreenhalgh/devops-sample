/etc/nagios/passwd:
  file.managed:
    - user: root
    - group: apache
    - mode: 640
    - source: salt://nagios/passwd.jinja
    - template: jinja
    - defaults:
        password: {{ pillar['nagios']['server']['password'] }}
