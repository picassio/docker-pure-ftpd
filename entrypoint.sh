#! /bin/bash
set -e

groupadd -g 1000 ftpgroup && useradd -u 1000 -g 1000 -d /home/ftpuser -s /sbin/nologin ftpuser
chown -R ftpuser:ftpgroup /home/ftpuser
[[ -f /opt/purefptd/etc/pureftpd.passwd ]] && /opt/purefptd/bin/pure-pw mkdb || touch /opt/purefptd/etc/pureftpd.passwd && /opt/purefptd/bin/pure-pw mkdb

exec $@
