#using https://github.com/25th-floor/docker-make-stub
$(eval $(call defw,CONTEXT,minikube))

include ./Makefile.mk
include ./make/*.mk

#NAME=$(shell basename $(PWD))


.PHONY: example-se
example-se: ##@Examples How to use $(shell_env)
	@echo ""
	@echo 'example: how to to use $$(shell_env)'
	@printf "=%.0s" {1..80}
	@echo ""
	@echo '$$(shell_env) my_command'
	$(shell_env) echo "echoing I_AM_A_VARIABLE=$${I_AM_A_VARIABLE}"
	