# datagrid
Smart home technology for makerspaces and hackerspaces.


A simple setup for running anything in docker, anywheres wich includes portainer, tick stack, auto scaling, auto upgrading, traefik based networking. Includes everything to run one's own infrastructure at production scale.

To expand the cluster build the new boot2docker vm, join the swarm cluster, deploy this to the master. Global deployments are setup so once the hardware is available it should auto setup on additonal machines.

## Roadmap

### 1.0.0

  - Fully intergrated home assistant
  - Fully intergrated openfaas
  - Tensorflow stack
  - Fully intergrated Minio
  - Regular backups with Volumerize

### 1.1.0

  - Etherium Testnet with cubedro/eth-netstats as the ui
  - ipfs cluster
  - Centralized Octoprint
  - Support for Ros
  - Support for jupyter notebooks and tensorflow

### 1.2.0

  - OwnTracks instance
  - Killbill intergration with Odoo
  - Nextcloud stack
  - Drone and Gitea stack
  - ZeroTier and ZeroTier-dns Support

## deploying services / FaaS tasks/ etc..

Include the followling labels at deployment:

```
<<: *orbiter
traefik.frontend.priority: 10
traefik.frontend.rule: Host:...
traefik.frontend.port: ..
```

## Setup

docker-machine -d generic create $RHOST
docker-machine ssh $RHOST docker swarm init
eval $(docker-machine env $RHOST)


## Deploy

make all

## Reconfiguring

... make changes to config files...

```make deploy```

Test, then clean up with `docker system prune -af`
