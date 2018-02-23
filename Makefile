DOTS=\
bin \
.bash_prompt \
.bash_profile \
.config/bspwm \
.config/compton.conf \
.config/dunst \
.config/gtk-3.0 \
.config/sxhkd \
.config/termite \
.emacs.d \
.gitconfig \
.tmux.conf \
.vim \
.vimrc \
.xinitrc \
.Xmodmap \
.Xresources
 
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

