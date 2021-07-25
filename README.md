# docker

docker volume rm $(docker volume ls -q)
docker system prune --all --volumes

sudo mount -v -t nfs -o vers=4,port=2049 192.168.0.201:/ docker/data
umount -f -l /mnt/myfolder

- add nfs server and qbittorrent to swarm once https://github.com/moby/moby/issues/25885 is finished

curl ifconfig.me
http://whois.domaintools.com
sudo ifconfig -a 

https://github.com/moby/moby/issues/29133