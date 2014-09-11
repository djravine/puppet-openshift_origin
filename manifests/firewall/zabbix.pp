class openshift_origin::firewall::zabbix {
  lokkit::services{ 'ZABBIX':
    tcpPorts => [ '10050', '10051' ],
  }
}
