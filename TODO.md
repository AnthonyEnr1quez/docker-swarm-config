# docker
Set up self-hosted infrastructure using docker swarm.

The format is based on [TODO.md](https://github.com/todomd/todo.md).

### Todo

  - [ ] default routing for docker host port 80 https://github.com/pi-hole/docker-pi-hole#tips-and-tricks  
  - [ ] create script for local dns gen https://dev.to/stjohnjohnson/internal-domains-with-dnsmasq-and-pi-hole-4cof  
- [ ] ansible playbook to automate pi setup?  
- [ ] shepherd  
  - [ ] notifications  
- [ ] bitwarden?  
- [ ] disposable email container?  
- [ ] ddClient  
- [ ] homepage  
- [ ] setup pihole dns based on generated caddy file  
- [ ] have sonarr use caddy urls instead of container directly http://containername:port  
- [ ] drone ci  
- [ ] trakt  
- [ ] rss  
- [ ] graph monitors  
- [ ] gaps  
- [ ] bazarr  
- [ ] grocy  
- [ ] authelia  
- [ ] email, poste.io  
- [ ] adguard home  
- [ ] hashicorp vault  
- [ ] nas auto remount  
- [ ] when mounting nfs from dir with both nas and sd card folder, containers will write to sd card in "nas" folder  

### In Progress

- [ ] radarr  
- [ ] media server  

### Done ✓

- [x] pihole  
  - [x] unbound  
  - [x] stubby  
- [x] gitea  
- [x] fix whoogle  
- [x] portainer  
- [x] eventually nas  
- [x] ability to expand  
- [x] reverse proxy to containers  
- [x] update to use docker swarm  

