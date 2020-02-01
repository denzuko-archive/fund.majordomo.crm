TARGETS		:= $(shell find * -maxdepth 1 -mindepth 0 -type d -not -path '*.git*' -prune -print)
CLEAN	    := $(addprefix clean-,$(TARGETS))
DEPLOY	    := $(addprefix deploy-,$(TARGETS))

export RELEASE_VERSION		:= $(shell date +%s)
export DEFAULT_NETWORK		:= public
export DOMAINNAME		:= testnet.dapla.net
export CF_EMAIL		:= EDITME
export CF_API_KEY		:= DIDNTEDITME

NETWORKS		:= public internal
STACK_NAME		:= $(shell basename "$$(pwd)")

.DEFAULT_GOAL		:= all
.DEFAULT: all
.PHONY: all deploy network image clean

all: clean deploy

clean-%:
	@$(MAKE) -C $(subst clean-,'',$@) clean

deploy-%: 
	@$(MAKE) -C $(subst deploy-,'',$@) deploy

$(NETWORKS):
	@-docker network create -d overlay --scope swarm $@

clean: $(CLEAN)
deploy: image network $(DEPLOY)

network: $(NETWORKS)

image:
	@exit 0

scan:
	@docker image ls | awk '/ago/ { system("docker run --rm -v /var/run/docker.sock:/var/run/docker.sock oliviabarnett/actuary:latest $$3); }'

distclean: clean
	@docker system prune -af
