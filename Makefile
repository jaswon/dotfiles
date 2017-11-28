DOTS := $$(find . -maxdepth 1 \! -name "*git*" | grep "./\..*" |  xargs -n1 basename)

.PHONY: list

all:

list: ## show dots in this repo
	@echo $(DOTS)

deploy: ## symlink to home
	for fname in $(DOTS); do ln -sfnv $(abspath $$fname) $(HOME)/$$fname ; done

update: ## fetch changes
	git pull origin master
	git submodule update --init --recursive

install: update deploy

clean: ## remove dots in home
	for fname in $(DOTS); do rm -vrf $(HOME)/$$fname ; done
