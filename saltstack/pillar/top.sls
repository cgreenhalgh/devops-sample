base:
  '*':
    - nagios
  '127.0.0.1':
    - mysql.server
    - mysql.db.wp1
    - nagios.server
    - nagios.user
    {% if grains['os'] == 'CentOS' %}
    - nagios.centos
    {% endif %}
