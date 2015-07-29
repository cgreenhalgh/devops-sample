base:
  '*':
    - nagios
  '127.0.0.1':
    - nagios.server
    - nagios.user
    {% if grains['os'] == 'CentOS' %}
    - nagios.centos
    {% endif %}
