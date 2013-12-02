# User Configs

This repo contains most config I use

Contents:
 - vim
 - [i3](http://i3wm.org/)
 - mplayer
 - git

## Install

```console
$ git clone git@github.com:measles/user_configs.git
$ make -C user_configs install
```

## Update

```console
$ git pull
$ make install
```

##  i3 install
```console
$ make -C user_config i3_<location>
```
Where \<location\> is **home** or **work**

## About

Based on the idea and Makefile from https://github.com/crible/dotfiles . Thanks a lot @crible for advices.

