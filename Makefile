# Makefile for VPN server setup
#
.PHONY: setup all bootstrap reset clean

USER_VAR=server_deploy_user_name
VAR_FILE=group_vars/all.yml

all: setup
	U=$$(grep ${USER_VAR} ${VAR_FILE} | awk -F: '{print $2}'); \
	ansible-playbook -u $$U openvpn.yml

setup:
	@./bin/setup

bootstrap:
	ansible-playbook -u root -k bootstrap.yml

reset:
	rm -f inventory ${VAR_FILE}

clean:
	rm -f *.retry
