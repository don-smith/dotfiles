# Path to your oh-my-zsh installation.
export ZSH=/home/don/.oh-my-zsh

export LANG=en_NZ.UTF-8
export LC_MESSAGES="C"

github() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/github
}

fixinput() {
  xmodmap ~/.Xmodmap
}

tpon() {
  echo "TouchPad turned on"
  synclient TouchPadOff=0
  synclient TapButton1=1
  synclient VertScrollDelta=-60
  synclient HorizScrollDelta=-60
}

tpoff() {
  echo "TouchPad turned off"
  synclient TouchPadOff=2
  synclient TapButton1=0
  echo "pointer = default" | xmodmap -
}

showmain() {
  xrandr --output eDP1 --mode 1680x1050
  xrandr --output eDP1 --mode 1920x1080
}

setdisplay() {
  [[ $1 == l* ]] && pos="--left-of"
  [[ $1 == r* ]] && pos="--right-of"
  [[ $1 == s* ]] && pos="--same-as"

  xrandr --addmode $2 1920x1080
  xrandr --output $2 --mode 1920x1080 $pos eDP-1
}

adddp() {
  setdisplay $1 HDMI-1
}

addhdmi() {
  setdisplay $1 HDMI-2
}

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:~/bin:~/.nvm/versions/node/v6.7.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/local/opt/go/bin:~/projects/go/bin:/usr/local/packer:/usr/local/packer
