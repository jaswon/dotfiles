DOTS=\
bin \
.bash_profile \
.bashrc \
.profile \
.prompt \
.config/gtk-3.0 \
.config/nvim \
.config/rofi \
.config/termite \
.gitconfig \
.vim \
.vimrc \
.xinitrc \
.Xmodmap \

install: clean update deploy

list: ## show dots in this repo
	@echo -e "\n---\nshowing dots\n---\n"
	@for fname in $(DOTS); do echo $(abspath $$fname); done

deploy: ## symlink to home
	@echo -e "\n---\nsymlinking dots\n---\n"
	for fname in $(DOTS); do ln -sfnv $(abspath $$fname) $(HOME)/$$fname ; done

update: ## fetch changes
	@echo -e "\n---\nfetching changes\n---\n"
	-git pull origin master
	-git submodule update --init --recursive

clean: ## remove dots in home
	@echo -e "\n---\nremoving dots in home\n---\n"
	for fname in $(DOTS); do rm -vrf $(HOME)/$$fname ; done

