#
# Main, general rules
#

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
	+make vim-install
	+make mplayer-install
	+make post-install

clean:
	+make vim-clean
	+make mplayer-clean

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

i3_home:
	+make i3-clean
	@ln -sf $(CURDIR)/i3/home/.i3 $(HOME)/.
	#perhaps, ther has to be used 'restart' commad.
	i3 reload

i3_work:
	+make i3-clean
	@ln -sf $(CURDIR)/i3/work/.i3 $(HOME)/.
	#perhaps, ther has to be used 'restart' commad.
	i3 reload

i3-clean:
	@rm -rf ./$(HOME)/.i3

mplayer-clean:
	@rm -rf $(HOME)/.mplayer

mplayer-install:
	@ln -sf $(CURDIR)/mplayer/.mplayer $(HOME)/.
