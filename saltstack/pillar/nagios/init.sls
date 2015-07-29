nagios:
  nrpe:
    nrpe_commands:
      - command[check_users]=/usr/lib64/nagios/plugins/check_users -w 5 -c 10
      - command[check_load]=/usr/lib64/nagios/plugins/check_load -w 15,10,5 -c 30, 25,20
      - command[check_hda1]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1
      - command[check_zombie_procs]=/usr/lib64/nagios/plugins/check_procs -w 5 -c 10 -s Z
      - command[check_total_procs]=/usr/lib64/nagios/plugins/check_procs -w 150 -c 200
