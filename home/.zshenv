export DOTFILES=/home/don/projects/dotfiles
export ZSH=/home/don/.oh-my-zsh
export REPLYTO="don@dezent.io"

export LANG=en_NZ.UTF-8
export LC_MESSAGES="C"
export VISUAL="nvim"
export EDITOR="nvim"

# Remove the 0.4s vi-mode lag
export KEYTIMEOUT=1

# For OS-wide theme support for QT5 apps
export QT_QPA_PLATFORMTHEME=qt5ct

# Set theme for GTK 2 apps
export GTK_THEME="Arc-Darker"

# Enable a GUI prompt when using SSH
export SSH_ASKPASS=ssh-askpass

# Java & Android
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=~/Android/Sdk
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_SDK_HOME=~/Android/Sdk
export ANDROID_AVD_HOME=~/.android/avd

# Ruby
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

# asciinema.org
# export ASCIINEMA_INSTALL_ID=$(cat $HOME/.config/asciinema/install-id)
if [ -e /home/don/.nix-profile/etc/profile.d/nix.sh ]; then . /home/don/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
