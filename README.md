# vpn-server

Ansible Playbooks for setting up a secured remote VPN server.

## Quick Start

Prerequisite: Recent version of [Ansible](http://docs.ansible.com) installed
on your control host.

- Create a recent Ubuntu server, using whatever process you choose. I created
  an Ubuntu 16.10 x64 server in the cloud.

- `make`

- Reboot the installed server and copy the unified `myvpn.ovpn` client profile
  from the server's `/etc/openvpn/keys` directory to use by your clients.

The first time you run this, it will run `./bin/setup` and set your
`./inventory` files and variable files in `./group_vars/all/`.

Use `make reset` to remove these files and start over.

You can also `make redo` if you make changes to your
base variables and want to push those changes to your server.

If you want to make changes to your secrets (e.g. add/remove users or change
passwords), use `make edit`. This task decrypts and re-encrypts your secrets
using `ansible-vault`.

## User password hashes

Refer to the [Ansible docs regarding user passwords](http://docs.ansible.com/ansible/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module)
to understand how we generate the Linux user password hashes to make or
modify user accounts on the VPN server.

To ensure this works, make sure that the `./bin/mkpasswd` script works:

      ./bin/mkpasswd TestTheHash
      $6$JBPVsmzre/hFkiFF$RfmrOFdkXs.QNF515TIGtokseUafj[...]

If you want to edit your secrets, the easiest think is to use the `edit` task,
like this:

      $ EDITOR=vi make edit
      Decryption successful

      NOTE: Run "make redo" to push your changes.

      $ make redo

## References

- [Securing a Server with Ansible](https://ryaneschinger.com/blog/securing-a-server-with-ansible/)
- [Digital Ocean guide on OpenVPN](http://archive.is/eHtSi)
