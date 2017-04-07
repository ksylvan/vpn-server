# Makefile for VPN server setup
#
.PHONY: setup all bootstrap rebootstrap reset clean

USER_VAR=server_deploy_user_name
VAR_FILE=group_vars/all/vars.yml

all: setup
	@U=$$(grep ${USER_VAR} ${VAR_FILE} | awk -F: '{print $$2}'); \
	echo "Running playbook using $$U user"; \
	ansible-playbook -u $$U openvpn.yml

setup:
	@./bin/setup

bootstrap:
	ansible-playbook -u root -k bootstrap.yml

rebootstrap:
	@U=$$(grep ${USER_VAR} ${VAR_FILE} | awk -F: '{print $$2}'); \
	ansible-playbook -u $$U bootstrap.yml

reset:
	rm -rf inventory group_vars .vault_pass.txt
	touch .vault_pass.txt; chmod 600 .vault_pass.txt

clean:
	rm -rf *.retry
