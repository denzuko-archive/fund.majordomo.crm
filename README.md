# fund.majordomo.crm

Docker based deployment of Majordomo Fund's CRM platform.

## Install Howto

```
ENVIRONMENT=production
[docker-machine create](https://blog.scottlowe.org/2016/03/22/using-docker-machine-with-aws/) $ENVIRONMENT
eval $(docker-machine env $ENVIRONMENT)
docker swarm init
uudecode -o /dev/stdout < site-master.tgz.uue| tar zx
make DOMAINNAME=example.com all
```

## Recommended hardware

* T3.medium
* 20Gb ssd

## Environment Varables
Key | Description
-|-
DOMAINNAME | Top level domain name (defaults: testnet.dapla.net)
TZ | Timezone control (defaults: Etc/UTC)
ENVIRONMENT | release environment (defaults: N/A, <production | development | staging>)

## Usage

### Odoo
https://crm.$DOMAINNAME
login: admin / admin

### System Admin
https://dashboard.$DOMAINNAME

### Monitoring
https://monitoring.$DOMAINNAME/sources/0/hosts
