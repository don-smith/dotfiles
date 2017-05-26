# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hippy"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vim="nvim"
alias v="nvim"
alias vp="v -p"
alias vd="v -d"
alias c="clear"
alias cl="c; l"
alias cls="c; ls"
alias cgst="c; gst"
alias t="npm test"
alias py="python"
alias bt="bluetoothctl"
alias gdc="gd --cached"
alias gdr="git diff-tree --name-status -r"
alias zshrc="v ~/.zshrc"
alias zshenv="v ~/.zshenv"
alias zprofile="v ~/.zprofile"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias vimrc="v ~/.config/nvim/init.vim"
alias tre="tree -a -C -I 'node_modules|.git' --dirsfirst"
alias ct="c; tre"
alias rmd="rm -fr"
alias git="hub"
alias gll="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

bindkey "^R" history-incremental-search-backward

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm archlinux docker)

# Wire up Chruby
#source /usr/local/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh

# Command completion for Docker Compose
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

source $ZSH/oh-my-zsh.sh

export NVM_DIR="/home/don/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Automatically apply the designated node version based on the .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc  ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

[[ -s "/home/don/.gvm/scripts/gvm" ]] && source "/home/don/.gvm/scripts/gvm"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
