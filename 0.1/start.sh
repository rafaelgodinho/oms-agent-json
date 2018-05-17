#!/bin/bash

#Install OMS Agent
/omsagent-1.6.0-42.universal.x64.sh --upgrade -w ${WSID} -s ${SECRET}

#Create config file to read JSON endpoint
serverdetails_conf="/etc/opt/microsoft/omsagent/${WSID}/conf/omsagent.d/serverdetails.conf"

cat > ${serverdetails_conf} << EOF
<source>
  type exec
  command 'curl ${URL}'
  format json
  tag oms.api.${NAME}
  run_interval 30s
</source>

<match oms.api.${NAME}>
  type out_oms_api
  log_level info

  buffer_chunk_limit 5m
  buffer_type file
  buffer_path /var/opt/microsoft/omsagent/${WSID}/state/out_oms_api_${NAME}*.buffer
  buffer_queue_limit 10
  flush_interval 20s
  retry_limit 10
  retry_wait 30s
</match>
EOF

#Give permission to OMS Agent to access the config file
chown omsagent:omiusers ${serverdetails_conf}

#Restart the OMS Agent
service omsagent-${WSID} restart

sleep infinity