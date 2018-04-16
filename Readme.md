# Installing RootIO

```
git clone https://github.com/CRJI/rootio-install-scripts
cd rootio-install-scripts
sudo ./install-ansible.sh
./run-ansible
sudo supervisorctl update
sudo service nginx reload
```

Freeswitch and other services listen on a bunch of public TCP and UDP ports.
Consider setting up a firewall.
