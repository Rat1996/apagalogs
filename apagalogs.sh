#!/bin/bash

log=/tmp/exclusao_logs
echo "Inicio: `date +%d-%m-%y_%H:%M:%S`" >> $log

echo "-------- Rotacionando logs --------"
logrotate --force /etc/logrotate.conf
sleep 1
asterisk -rx 'logger rotate'
asterisk -rx 'logger reload'
sleep 1
echo "-------- OK --------"
echo "--------Excluindo logs--------"
cd /var/log
echo > dnsmasq
echo > wildfly/console.log
rm -rfv boot.log.* fail2ban.log-* cron.* messages-* btmp-* dracut.log-* maillog-* yum.log-* boot.log-* cron-* wtmp-* spooler-* secure-* fail2ban.log.* kernel.log.* maillog.* messages.* pf.processaqueuelog.log.* rpmpkgs.* secure.* spooler.* stund.log.* wtmp.* xferlog.* yum.log.* zebedee.log.* *.gz
sleep 1
cd /var/log/httpd
rm -rfv error_log-* ssl_error_log-* access_log-* ssl_access_log-*
sleep 1
cd /var/log/zabbix
rm -rfv zabbix_agentd.log-* *.gz
sleep 1
cd /var/log/audit
rm -rfv audit.log.*
sleep 1
cd /var/log/asterisk
rm -rfv full.* queue_log.* messages.* event_log.* full_* *.gz
cd /var/log/wildfly
echo > console.log
cd
cd /opt/wildfly/standalone/log
echo > server.log
rm -rfv server.log.*
echo "-------- OK --------"
echo "Fim: `date +%d-%m-%y_%H:%M:%S`" >> $log
exit 0