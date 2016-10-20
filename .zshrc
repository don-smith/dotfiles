# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hippy"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias v="nvim"
alias c="clear"
alias cl="c; l"
alias cls="c; ls"
alias t="npm test"
alias py="python"
alias zshrc="v ~/.zshrc"
alias zshenv="v ~/.zshenv"
alias vimrc="v ~/.config/nvim/init.vim"
alias tre="tree -a -C -I 'node_modules|.git' --dirsfirst"
alias ct="c; tre"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm archlinux)

# Fix Ctrl-h for Neovim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti && rm $TERM.ti

# Wire up Chruby
#source /usr/local/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh

# Command completion for Docker Compose
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

source $ZSH/oh-my-zsh.sh

export NVM_DIR="/home/don/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# For the Powerline bar
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config

# Automatically apply the designated node version based on the .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc  ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc


[[ -s "/home/don/.gvm/scripts/gvm" ]] && source "/home/don/.gvm/scripts/gvm"
