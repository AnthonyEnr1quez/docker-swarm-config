# docker
Set up self-hosted infrastructure using docker swarm.

The format is based on [TODO.md](https://github.com/todomd/todo.md).

### Todo

- [ ] backup local db to nas using borg?  
- [ ] put nfs_server in swarm and connect containers to it through mesh network? https://serverfault.com/a/824548  
  - [ ] plex transcoding (only works with plex pass)  
- [ ] nfs mount permissions, read and write?, locks?  
- [ ] gitea  
- [ ] ansible playbook to automate pi setup?  
- [ ] shepherd  
  - [ ] notifications  
- [ ] bitwarden?  
- [ ] disposable email container?  
- [ ] ddClient  
- [ ] homepage  
- [ ] setup pihole dns based on generated caddy file  
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

### In Progress


### Done ✓

- [x] have sonarr use caddy urls instead of container directly http://containername:port  
- [x] pihole  
  - [x] stubby  
  - [x] unbound  
- [x] docker stack env not working, use swarm secrets?  
- [x] Check hard links, uid, gid, umask  
- [x] plex  
- [x] Update README.md  
- [x] fix whoogle  
- [x] portainer  
- [x] eventually nas  
- [x] ability to expand  
- [x] reverse proxy to containers  
- [x] update to use docker swarm  
- [x] radarr  

