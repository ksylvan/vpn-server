# Makefile for VPN server setup
#
.PHONY: setup all bootstrap rebootstrap reset clean

USER_VAR=server_deploy_user_name
VAR_FILE=group_vars/all/vars.yml

ROLES=roles/Stouts.openvpn

all: ${ROLES} setup
	@U=$$(grep ${USER_VAR} ${VAR_FILE} | awk -F: '{print $$2}'); \
	echo "Running playbook using $$U user"; \
	ansible-playbook -u $$U openvpn.yml

# First time run
setup:
	@./bin/setup

# bootstrap sets up a secure ubuntu server
bootstrap:
	ansible-playbook -u root -k bootstrap.yml

# since root ssh logins are disabled, need to run this when boostrapping again
rebootstrap:
	@U=$$(grep ${USER_VAR} ${VAR_FILE} | awk -F: '{print $$2}'); \
	ansible-playbook -u $$U bootstrap.yml

# clean up and start over
reset:
	rm -rf inventory group_vars .vault_pass.txt
	touch .vault_pass.txt; chmod 600 .vault_pass.txt

# simple cleanup of ansible cruft
clean:
	rm -rf *.retry

# assume roles are defined in requirements.yml
${ROLES}:
	ansible-galaxy install -p roles -r requirements.yml
