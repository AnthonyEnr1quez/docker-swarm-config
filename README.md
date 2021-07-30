# docker

Configuration to host docker services using docker swarm.

## Currently Working Services

* [nfs_server] - nfsv4 server
* [caddy](caddy.yml) - caddy 2 reverse proxy
* [portainer](portainer.yml) - container management UI
* [stubby](stubby.yml)- DNS Privacy stub resolver using DNS-over-TLS
* [unbound](unbound.yml) - validating, recursive, caching DNS resolver
* [pihole](pihole.yml)- ad blocking DNS server
* [transmission](transmission.yml)- torrent client
* [plex](plex/plex.yml)- media server
* [prowlarr](prowlarr.yml) - automated indexer manager
* [sonarr](sonarr.yml) - automated TV show manager
* [radarr](radarr.yml) - automated movie manager
* [whoogle](whoogle.yml) - private google searches

### Reverse Proxy

Any service with a front-end UI will be reachable through the caddy proxy. The regular ports are hidden from the hosting node. Caddy is currently generating internal TLS certs on the fly. Future configurations will work with cloudflare for persistent, trusted certs. The current url pattern is `$service_name.lan.com`

### Volumes

Most volumes are mounted to the container using the nfs share created with [nfs_server]. This allows persistent storage of container data and the service to be spun up on any node.
A couple exceptions are listed below:

* plex: the plex library and database have issues with file locking over nfs shares. It may be possible to configure but is a headache (see [here](https://www.reddit.com/r/PleX/comments/ff4a59/plex_hangs_with_library_and_database_on_nfs/)).
* [nfs_server]: needs to mount the the locally mounted nas server to share

### Secrets/Env Files

Enviornment variables are currently being managed by a combination of bash scripts and an ignored `.env` file on the manager node.

### Bash Scripts

There are two bash scripts created to help automate deployment steps.

* [`start_all.sh`] - This sets up all the supported services in this repository.
* [`update.sh`](update.sh)- Use this to quickly redeploy swarm services from the manager node with the correct nfs settings
  * The following services are currently not supported by this script: stubby, unbound (see quirks below).

## Pihole/Stubby/Unbound Quirks

The stubby and unbound images are based on [MatthewVance/stubby-docker](https://github.com/MatthewVance/stubby-docker). The initalization script of the unbound container relies on the stubby service to be up and **RUNNING** to correctly populate the stubby container ip in the `unbound.conf`. Below is the required startup order of these services:

1. Start stubby container
2. Check that stubby container is running.
3. Start unbound container.
4. Start pihole container.

This process is somewhat automated in the [`start_all.sh`] script with the `running_check` function.

You will also need to manually enter the unbound container ip in the pihole dns setting (automation coming soon?).

## Plex Setup

The current easiest way to first setup the plex server is start the container using docker-compose and using host networking. Once the server is up and running, the plex service can be deployed into the swarm. The [setup_plex_server.yml](plex/setup_plex_server.yml) can be used if your plex server has not been created.

## Other Directories

* [broken](broken/): Compose definitions that are not working in their current state.
* [untested](untested/): Compose definitions that have not been tested in my current swarm setup and are not in the [`start_all.sh`].

## Useful Commands

* Remove all docker volumes on node: `docker volume rm $(docker volume ls -q)`
* Prune EVERYTHING: `docker system prune --all --volumes`
* Mount NFS: `sudo mount -v -t nfs -o vers=4,port=2049 192.168.0.201:/ docker/data`
* Unmount drive: `umount -f -l /mnt/myfolder`
* IP Testing commands and links
  * `curl ifconfig.me`
  * `sudo ifconfig -a`
  * [Whois Lookup](http://whois.domaintools.com)

[nfs_server]: nfs_server.yml
[`start_all.sh`]: start_all.sh
