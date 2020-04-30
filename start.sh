#! /bin/bash

/opt/purefptd/sbin/pure-ftpd -P $PUBLIC_HOST -p 30000:30009 -l puredb:/opt/purefptd/etc/pureftpd.pdb -E -j -R
