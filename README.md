# don-smith/dotfiles

> Config files for my Arch/Zsh system


## Setup

Applying this configuration is simply the process of running a `link` script that symlinks these files into where Zsh expects them to be.

```shell
git clone https://github.com/don-smith/dotfiles.git
cd dotfiles
# In ./home/.zshenv, ensure DOTFILES is the path to this repo
./link
```

The `link` script:
* symlinks the dotfiles in `./home` to `~`
* symlinks the files in `./config` to `~/.config`


## Structure

This configuration uses three [Zsh startup files](https://wiki.archlinux.org/index.php/Zsh#Startup.2FShutdown_files):

* `./home/.zshenv`
  - Used for setting up environment variables.
  - Will source `./paths` when logging in.
* `./home/.zprofile`
  - Used for running commands and setting up functions.
  - Will source the files in `./functions` when logging in.
* `./home/.zshrc`
  - Used for initialising Oh-My-Zsh and creating aliases.
  - Will source `./aliases` and the files in `./extras` for each interactive terminal session.

The `./bin` folder contains executable scripts and has been added to the `$PATH`.


## npm packages

To install all global npm packages, run `./npmig`. To install existing global packages to a new node installation using nvm:

```sh
nvm install v9.2.0 --reinstall-packages-from=v7.4.0
```
