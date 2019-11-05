#
# Main, general rules
#

all:
	+make help

help:
	@echo "Run as 'make <target>' where <target> is:"
	@echo "  install - install congif files"
	@echo "  clean   - clean config files"

install:
	+make clean
	+make vim-install
	+make mplayer-install
	+make git-install
	+make post-install

clean:
	+make vim-clean
	+make mplayer-clean
	+make git-clean

post-install:
	+make vim-vundle


#
# Pakage-specific rules
#

vim-clean:
	@rm -rf $(HOME)/.vimrc
	@rm -rf $(HOME)/.gvimrc
	@rm -rf $(HOME)/.vim

vim-install:
	@ln -sf $(CURDIR)/vim/.vimrc $(HOME)/.
	@ln -sf $(CURDIR)/vim/.gvimrc $(HOME)/.
	@ln -sf $(CURDIR)/vim/.vim $(HOME)/.

vim-vundle:
	@rm -rf $(CURDIR)/vim/.vim/bundle/vundle
	@git clone git://github.com/gmarik/vundle.git $(CURDIR)/vim/.vim/bundle/vundle
	@vim +BundleInstall! +quitall

mplayer-clean:
	@rm -rf $(HOME)/.mplayer

mplayer-install:
	@ln -sf $(CURDIR)/mplayer/.mplayer $(HOME)/.

git-clean:
	@rm -rf $(HOME)/.gitconfig
	@rm -rf $(HOME)/.gitignore

git-install:
	@ln -sf $(CURDIR)/git/.gitconfig $(HOME)/.
	@ln -sf $(CURDIR)/git/.gitignore $(HOME)/.
