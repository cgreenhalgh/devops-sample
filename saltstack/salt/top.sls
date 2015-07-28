base:
  '127.0.0.1':
    - apache
    - nagios
    - nagios.user
  '*':
    - nagios.nrpe

