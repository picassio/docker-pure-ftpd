### Volume
* /opt/purefptd/etc/ 
* /home/ftpuser

### Environment
| Environment | Default value |
|---------|------------|
| PUBLIC_HOST | localhost |

### Custom usage:
```bash
docker container run -d \
	--name pure-ftpd \
	-p 21:21 \
	-p 30000-30009:30000-30009 \
	-v /your/data/folder:/home/ftpuser \
	-e PUBLIC_HOST=your-public-ip \
	-v $pwd/data/pure-ftpd:/opt/purefptd/etc/picassio/pure-ftpd:1.0
```

### Create user 
```bash
docker exec -it pure-ftpd /opt/purefptd/bin/pure-pw useradd test -m -u ftpuser -d /home/ftpuser/test
```
With *-m* so you don't need to refresh puredb


