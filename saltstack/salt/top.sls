base:
  '127.0.0.1':
    - apache
    - mysql
    - nagios.check_mk.mysql
    {% if grains['os'] == 'CentOS' %}
    - nagios.centos_server
    {% endif %}
    - nagios.check_mk
    - nagios.plugins
    - nagios.user
  '*':
    - nagios.nrpe

