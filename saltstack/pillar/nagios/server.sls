nagios:
  server:
    # check_mk!
    #cfg_dir: 
    #  - /etc/nagios/objects.salt
    cfg_file:
      - /etc/nagios/conf.d/check_mk_templates.cfg
      - /etc/nagios/conf.d/check_mk_objects.cfg

