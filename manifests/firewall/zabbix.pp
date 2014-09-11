class openshift_origin::firewall::zabbix {
  lokkit::ports{ 'zabbix':
    tcpPorts => [ '10050', '10051' ],
  }
}
