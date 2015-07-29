base:
  '127.0.0.1':
    - apache
    - nagios.objects
    - nagios.plugins
    - nagios.user
  '*':
    - nagios.nrpe

