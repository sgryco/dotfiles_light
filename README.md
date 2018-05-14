Original project by fxthomas: from https://github.com/fxthomas/dotfiles


Installation
============

Install missing packages:

```bash
sudo apt-get install vim htop tmux build-essential
```

Run this on the terminal :

```bash
# Clone main repository
git clone https://github.com/sgryco/dotfiles_light.git ~/.dotfiles

# Initialize the submodules
cd ~/.dotfiles; ./install.sh
```


## Run zsh as default shell without modifying /etc/passwd by replacing bash

Add this line in your `~/.bash_profile` to load `~/.profile`
```bash
if [ -f ~/.profile ]; then source ~/.profile; fi
```

Then add this in your `~/.profile`
```bash
[ -z "$ZSH_VERSION" ] && [ -f /usr/bin/zsh ] && {
         exec /usr/bin/zsh -l
}
```
