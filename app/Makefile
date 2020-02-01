STACK_NAME		:= $(shell basename "$$(pwd)")

.DEFAULT_GOAL		:= all
.DEFAULT: all
.PHONY: all deploy network image clean

all: clean deploy

clean:
	@-docker stack rm $(STACK_NAME)

deploy: image network 
	@docker stack deploy -c docker-compose.yml $(STACK_NAME)

network: 
	@exit 0

image:
	@exit 0

scan:
	@exit 0
