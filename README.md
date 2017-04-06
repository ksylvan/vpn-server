# vpn-server

Ansible Playbooks for setting up a secured remote VPN server.

## Quick Start

Create a recent Ubuntu server, using whatever process you choose. I created
an Ubuntu 16.10 x64 server in the cloud.

Run `make`

The first time you run this, it will run an interactive script and
based on your answers, will create a file `./inventory` and a set of
variables in `./group_vars/all.yml`.

You can also run `make reset` to remove these files and start over.

## References

- [Securing a Server with Ansible](https://ryaneschinger.com/blog/securing-a-server-with-ansible/)
