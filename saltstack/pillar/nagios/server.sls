nagios:
  server:
    cfg_dir: 
      - /etc/nagios/objects.salt
  lookup:
    nagios:
      service: nagios
      server: nagios
      plugins: nagios-plugins-all
      conf: /etc/nagios/nagios.cfg
      cgi_conf: /etc/nagios/cgi.cfg
      resource_file: /etc/nagios/resource.cfg
      log: /var/log/nagios/nagios.log
      object_cache: /var/log/nagios/objects.cache
      precached_object_file: /var/log/nagios/objects.precache
      status_file: /var/log/nagios/status.dat
      command_file: /var/spool/nagios/cmd/nagios.cmd
      lock_file: /var/run/nagios.pid
      temp_file: /var/log/nagios/nagios.tmp
      log_archive_path: /var/log/nagios/archives
      check_result_path: /var/spool/nagios/checkresults
      state_retention_file: /var/log/nagios/retention.dat
      p1_file: /usr/sbin/p1.pl
      debug_file: /var/log/nagios/nagios.debug
    cgi:
      config_file: /etc/nagios/nagios.cfg
      physical_html_path: /usr/share/nagios/html
      url_html_path: /nagios
      nagios_check_command: "/usr/lib/nagios/plugins/check_nagios /var/nagios/status.dat 5 '/usr/sbin/nagios'"

