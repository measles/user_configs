all:
	+make help

help:
	@echo "Run as 'make <target>' where <target> is:"
	@echo "  install - install congif files"
	@echo "  clean   - clean config files"

install:
	+make clean
	@ln -sf $(CURDIR)/vim/.vimrc $(HOME)/.
	@ln -sf $(CURDIR)/vim/.gvimrc $(HOME)/.
	@ln -sf $(CURDIR)/vim/.vim $(HOME)/.
	+make post-install

clean:
	@rm -rf $(HOME)/.vimrc
	@rm -rf $(HOME)/.gvimrc
	@rm -rf $(HOME)/.vim

post-install:
	+make vim-vundle

vim-vundle:
	@rm -rf $(CURDIR)/vim/.vim/bundle/vundle
	@git clone git://github.com/gmarik/vundle.git $(CURDIR)/vim/.vim/bundle/vundle
	@vim +BundleInstall! +quitall

