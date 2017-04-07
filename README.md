# vpn-server

Ansible Playbooks for setting up a secured remote VPN server.

## Quick Start

- Create a recent Ubuntu server, using whatever process you choose. I created
  an Ubuntu 16.10 x64 server in the cloud.

- `make`

The first time you run this, it will run an interactive script and
based on your answers, will create a file `./inventory` and a set of
variable files in `./group_vars/all/`.

Use `make reset` to remove these files and start over.

You can also `make rebootstrap` if you make changes to your
base variables and want to push those changes to your server.

## References

- [Securing a Server with Ansible](https://ryaneschinger.com/blog/securing-a-server-with-ansible/)
- [Digital Ocean guide on OpenVPN](http://archive.is/eHtSi)
