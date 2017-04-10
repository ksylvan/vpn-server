# vpn-server

Ansible Playbooks for setting up a secured remote VPN server.

## Quick Start

- Create a recent Ubuntu server, using whatever process you choose. I created
  an Ubuntu 16.10 x64 server in the cloud.

- `make`

The first time you run this, it will run `./bin/setup` and set your
`./inventory` files and variable files in `./group_vars/all/`.

Use `make reset` to remove these files and start over.

You can also `make rebootstrap` if you make changes to your
base variables and want to push those changes to your server.

If you want to make changes to your secrets (e.g. add users or change various
passwords), use `make edit`. This task decrypts and re-encrypts your secrets
using `ansible-vault`. If you change any Linux account passwords, you
will also have to fix the SHA-512 encrypted form.

## References

- [Securing a Server with Ansible](https://ryaneschinger.com/blog/securing-a-server-with-ansible/)
- [Digital Ocean guide on OpenVPN](http://archive.is/eHtSi)
