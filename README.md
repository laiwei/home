# 安装vim


	## vim7.3+
	wget http://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
	locate python | grep '/config$'
	./configure --with-features=huge \
	            --enable-multibyte \
	            --enable-rubyinterp \
	            --enable-pythoninterp \
	            --with-python-config-dir=/usr/lib64/python2.6/config \
	            --enable-perlinterp \
	            --enable-luainterp \
	            --enable-gui=gtk2

## clone code env repo

    git clone git@github.com:laiwei/home.git ~/.codeenv
    cd ~/.codeenv && sh install.sh
    fc-cache -vf ~/.fonts
    vim
    :BundleInstall
    :q

####
	#install rbenv
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

	#install tmux
	## libevent 2.x
	git clone https://github.com/libevent/libevent.git 
	cd libevent; git checkout -b release-2.0.22-stable release-2.0.22-stable; ...
	## tmux
	git clone git://git.code.sf.net/p/tmux/tmux-code tmux
	cd tmux; ...

	#install ycm/vim
	## cmake
	wget http://www.cmake.org/files/v3.2/cmake-3.2.1.tar.gz
	...

	## global 
	wget http://tamacom.com/global/global-6.4.tar.gz
	...

	## ycm
	cd ~/.vim/bundle/YouCompleteMe
	./install.sh --clang-completer

	## golang
	cd
	mkdir gopath
	git clone https://github.com/golang/go
	cd go
	git checkout go1.4.1
	cd src
	./all.bash

## tips        

	leader 设置为逗号，以下简称为l
	l-x 表示先按leader,再按x
	C-x 表示按住ctrl的同时，按下x

	<l-space>	打开/关闭NERD_tree
		t		在tab中打开
	<C-h/l>		tab间切换
	<l-h/j/k/l> wincmd 方向
	<l-u>		update diff


---
                    __
                   / /
    __    ____  __/ /_  ____ 
    \ \  / / / / /  _ \/ _  \
     \ \/ / /_/ / /_/ / /_/ /
      \  /\____/_____/\____/
      / /   www.yubo.org
     /_/

