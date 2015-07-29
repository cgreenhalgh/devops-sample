# ensure check_result_path exists before starting nagios service
{% from "nagios/map.jinja" import nagios with context %}

include:
  - nagios.server

extend:
  nagios-service:
    service.running:
      - require:
          - file: {{ nagios.check_result_path }}

{{ nagios.check_result_path }}:
  file.directory:
    - user: nagios
    - group: nagios
    - mode: 777
    - require:
        - pkg: {{ nagios.server }}

     
