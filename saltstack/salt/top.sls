base:
  '127.0.0.1':
    - apache
    {% if grains['os'] == 'CentOS' %}
    - nagios.centos_server
    {% endif %}
    - nagios.check_mk
    - nagios.plugins
    - nagios.user
  '*':
    - nagios.nrpe

