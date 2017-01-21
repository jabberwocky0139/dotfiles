# Dotfiles
Basically, put symbolic links of dotfiles(.emacs.d, .Xmodmap...) on your home directory `~/`.

## requirements for .emacs.d
Please install `autoconf` `automake` `cmigemo` `w3m` `surfraw` by `sudo apt(yum) install ...`.

You should build `pdf-tools` manually. Check `README.md` on .emacs.d/site-lisp/pdf-tools.

## xorg.conf.d
Configuration file for Ubuntu on Dell XPS 13. 
Put symbolic link of contained file(50-synaptics.conf) on `/etc/X11/xorg.conf.d`. If that directory is not found, `sudo mkdir /etc/X11xorg.conf.d`. 

