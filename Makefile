all:
	+make help

help:
	@echo "Run as 'make <target>' where <target> is:"
	@echo "  install - install congif files"
	@echo "  clean   - clean config files"
	@echo "  i3_home - install home version of i3 config"
	@echo "  i3_work - install work version of i3 config"

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

i3_home:
	+make i3_clean
	@ln -sf $(CURDIR)/i3/home/.i3 $(HOME)/.
	#perhaps, ther has to be used 'restart' commad.
	i3 reload

i3_work:
	+make i3_clean
	@ln -sf $(CURDIR)/i3/work/.i3 $(HOME)/.
	#perhaps, ther has to be used 'restart' commad.
	i3 reload

i3_clean:
	@rm -rf ./$(HOME)/.i3
