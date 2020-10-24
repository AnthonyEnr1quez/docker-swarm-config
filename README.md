## What do I want?
- [] update to use docker swarm
- [x] pihole
    - [] default routing for docker host port 80 https://github.com/pi-hole/docker-pi-hole#tips-and-tricks
    - [] create script for local dns gen https://dev.to/stjohnjohnson/internal-domains-with-dnsmasq-and-pi-hole-4cof
    - [] unbound
    - [] stubby
- [] media server, eventually nas
- [] ability to expand
- [] ansible playbook to automate pi setup?
- [x] reverse proxy to containers
- [] auto update containers
- [] bitwarden?
- [] k3s multiple pis
- [] disposable email container?
- [] ddClient
- [] homepage
- [] portainer
- [] setup pihole dns based on generated caddy file
- [] have sonarr use caddy urls instead of container directly http://containername:port
- [] gitea
- [] drone ci
- [] rss
- [] graph monitors
- [] gaps
- [] bazarr
- [] grocy
- [] fix whoogle
- [] authelia
- [] radarr
- [] email, poste.io
- [] adguard home

## docker swarm notes
1. init swarm
2. add workers
3. promote both workers to managers `docker node promote nodename`
4. create network with swarm scope `docker network create -d overlay proxy`
5. deploy stack `docker stack deploy --compose-file caddy/docker-compose.yml --compose-file pihole/docker-compose.yml stackName`
6. view services `docker service ps stackName_serviceName`
- need odd number of managers to prevent deadlock?
- [] figure out how to init in wsl