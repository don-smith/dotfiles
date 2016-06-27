# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias v="nvim"
alias c="clear"
alias cl="clear; l"
alias t="npm test"
alias py="python"
alias zshrc="v ~/.zshrc"
alias vimrc="v ~/.config/nvim/init.vim"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export NODE_PATH=/usr/local/lib/node_modules
export ANDROID_SDK=/Users/don/android-sdk
export ANDROID_HOME=/Users/don/android-sdk
export JAVA_HOME=$(/usr/libexec/java_home)
export GNUTERM=X11

# For the Node Version Manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Automatically apply the designated node version based on the .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc  ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

# For Python version/environment control
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/git/bin:/Users/don/android-sdk/tools:/usr/local/Cellar/todo-txt/2.9/bin:/Users/don/apache-maven-3.2.1/bin:/Users/don/gcc-arm/bin

# For Powerline Status bar
export POWERLINE_CONFIG_COMMAND=$HOME/.local/bin/powerline-config

# For Maven
export M3_HOME=/usr/local/Cellar/maven/3.3.3
export M3=$M3_HOME/bin
export PATH=$M3:$PATH
export MAVEN_OPTS='-Xmx512m -XX:MaxPermSize=128m'

# For user installed python packages
export PATH="$HOME/.local/bin:$PATH"

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
export PATH="$HOME/.cabal/bin:$GHC_DOT_APP/Contents/bin:$PATH"

# For MAMP and PHP config
export PATH="/Applications/MAMP/bin/php/php5.6.10/bin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# For Ant
export ANT_HOME="$HOME/Library/apache-ant-1.9.6"
export PATH="$PATH:${ANT_HOME}/bin"

# The next line enables chruby to do its magic
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 2.2.3

