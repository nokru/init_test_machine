#using https://github.com/25th-floor/docker-make-stub
$(eval $(call defw,CONTEXT,minikube))

include ./Makefile.mk
include ./make/*.mk

#NAME=$(shell basename $(PWD))

.PHONY: all
all: ##@Other Build all the containers and deploy them to kubernetes
all: build deploy

.PHONY: example-se
example-se: ##@Examples How to use $(shell_env)
  @echo ""
  @echo 'example: how to to use $$(shell_env)'
  @printf "=%.0s" {1..80}
  @echo ""
  @echo '$$(shell_env) my_command'
  $(shell_env) echo "echoing I_AM_A_VARIABLE=$${I_AM_A_VARIABLE}"

.PHONY: example-interfaces
example-interface:: ##@Examples Abuse double-colon rules
  @echo ""
  @echo "example: using double-colon rules to create and implement interface-ish targets"
  @printf "=%.0s" {1..80}
  @echo ""
  @echo "define 'target:: ##@Category not implemement' in .mk"
  @echo "implement 'target:: ##@Category this is nice' in Makefile"

.PHONY: du-overlay
du-overlay:: ##@System Display disk usage of overlay folder
  @sudo su -c 'du -hs /var/lib/docker/overlay2/* | sort -rh | head -20'
  