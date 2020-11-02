## What do I want?
- [x] update to use docker swarm
- [x] pihole
    - [] default routing for docker host port 80 https://github.com/pi-hole/docker-pi-hole#tips-and-tricks
    - [] create script for local dns gen https://dev.to/stjohnjohnson/internal-domains-with-dnsmasq-and-pi-hole-4cof
    - [] unbound
    - [] stubby
- [] media server
- [x] eventually nas
- [x] ability to expand
- [] ansible playbook to automate pi setup?
- [x] reverse proxy to containers
- [x] shepherd
    - [] notifications
- [] bitwarden?
- [] disposable email container?
- [] ddClient
- [] homepage
- [x] portainer
- [] setup pihole dns based on generated caddy file
- [] have sonarr use caddy urls instead of container directly http://containername:port
- [x] gitea
- [] drone ci
- [] rss
- [] graph monitors
- [] gaps
- [] bazarr
- [] grocy
- [x] fix whoogle
- [] authelia
- [x] radarr
- [] email, poste.io
- [] adguard home
- [] hashicorp vault
- [] nas auto remount
- [] when mounting nfs from dir with both nas and sd card folder, containers will write to sd card in "nas" folder

## docker swarm notes
1. init swarm
2. add workers
3. promote both workers to managers `docker node promote nodename`
4. create network with swarm scope `docker network create -d overlay proxy`
5. deploy stack `docker stack deploy --compose-file caddy/docker-compose.yml --compose-file pihole/docker-compose.yml stackName`
6. view services `docker service ps stackName_serviceName`
- need odd number of managers to prevent deadlock?
- [] figure out how to init in wsl

docker volume rm $(docker volume ls -q)

sudo mount -v -t nfs -o vers=4,port=2049 192.168.0.201:/ docker/data
umount -f -l /mnt/myfolder

- add nfs server and qbittorrent to swarm once https://github.com/moby/moby/issues/25885 is finished