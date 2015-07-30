{% from "mysql/defaults.yaml" import rawmap with context %}
{%- set mysql = salt['grains.filter_by'](rawmap, grain='os', merge=salt['pillar.get']('mysql:lookup')) %}

check_mk-mysql-monitor:
  mysql_user.present:
    - name: 'monitor'
    - host: 'localhost'
    - password: 'monitor'
    - requires:
      - pkg: {{ mysql.server }}
      - pkg: check-mk-agent

  mysql_grants.present:
    - user: 'monitor'
    - database: '*.*'
    - grant: 'select,show databases'
    - requires:
      - mysql_user: monitor

/etc/check-mk-agent/mysql.cfg:
  file.managed:
   - source: salt://nagios/check_mk/files/mysql.cfg
   - user: root
   - group: root
   - mode: 444
   - requires:
     - pkg: check-mk-agent

/usr/share/check-mk-agent/plugins/mk_mysql:
  file.symlink:
   - target: /usr/share/check-mk-agent/available-plugins/mk_mysql
   - user: root
   - group: root
   - mode: 555
   - requires:
     - pkg: check-mk-agent

