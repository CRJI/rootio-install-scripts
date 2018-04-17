# Installing RootIO

These instructions assume a Debian 8 (Jessie) machine because that's what
FreeSWITCH recommends:
https://freeswitch.org/confluence/display/FREESWITCH/Debian+8+Jessie

```
git clone https://github.com/CRJI/rootio-install-scripts
cd rootio-install-scripts
sudo ./install-ansible.sh
./run-ansible
sudo service freeswitch restart
cd /opt/rootio/rootio_web
sudo -u rootio /opt/rootio/bin/rootio_web reset_db
sudo -u rootio /opt/rootio/bin/rootio_web demo_data
sudo supervisorctl update
sudo service nginx reload
```

Freeswitch and other services listen on a bunch of public TCP and UDP ports.
Consider setting up a firewall.

Add the following line to your local `/etc/hosts`, replacing `192.168.1.2` with
the address of the server you have just set up:

```
192.168.1.2 rootio.example.org
```

Then point your browser to http://rootio.example.org, log in as `admin` with
password `123456`, and enjoy RootIO!
