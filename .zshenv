# Path to your oh-my-zsh installation.
export ZSH=/home/don/.oh-my-zsh

export LANG=en_NZ.UTF-8
export LC_MESSAGES="C"

kill-ssh-agents() {
  killall ssh-agent
}

github() {
  kill-ssh-agents
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/github
}

gitlab() {
  kill-ssh-agents
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/gitlab
}

digo() {
  kill-ssh-agents
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/digital-ocean
}

ssbpub() {
  kill-ssh-agents
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/ssb-pub
}

fixi() {
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
  synclient TouchPadOff=1
  synclient TapButton1=0
  echo "pointer = default" | xmodmap -
}

showmain() {
  xrandr --addmode eDP-1 1920x1080
  xrandr --output eDP-1 --mode 1680x1050
  xrandr --output eDP-1 --mode 1920x1080
}

setdisplay() {
  [[ $1 == a* ]] && pos="--above"
  [[ $1 == b* ]] && pos="--below"
  [[ $1 == l* ]] && pos="--left-of"
  [[ $1 == r* ]] && pos="--right-of"
  [[ $1 == s* ]] && pos="--same-as"

  xrandr --addmode $2 1920x1080
  xrandr --output $2 --mode 1920x1080 $pos eDP-1
}

dp() {
  setdisplay $1 DP-1
}

hdmi() {
  setdisplay $1 HDMI-2
}

trimon() {
  xrandr --addmode eDP-1 1920x1080
  xrandr --addmode DP-1 1920x1080
  xrandr --addmode HDMI-2 1920x1080
  xrandr --output DP-1 --mode 1920x1080 --pos 0x0
  xrandr --output HDMI-2 --mode 1920x1080 --pos 1920x0
  xrandr --output eDP-1 --mode 1920x1080 --pos 960x1080
}

mirror() {
  dp same
  hdmi same
}

brightness() {
  # cat /sys/class/backlight/intel_backlight/max_brightness
  # cat /sys/class/backlight/intel_backlight/actual_brightness
  sudo tee /sys/class/backlight/intel_backlight/brightness <<< $1
}

launchsteam() {
  # Location of games: ~/.local/share/Steam/steamapps/common
  LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' steam
}

xmind() {
  export SWT_GTK3=0; ~/Downloads/xmind/XMind_amd64/XMind
}

recordscreen() {
  ffmpeg -thread_queue_size 1024 -f alsa -i hw:1 -thread_queue_size 32 -f x11grab -s 1920x1080 -r 25 -i $DISPLAY -c:v libx264 -c:a aac "$1.mkv"
}

processrecording() {
  ffmpeg -i "$1.mkv" -c:v libx264 -af "volume=3.0" -crf 18 -preset slow -pix_fmt yuv420p -c:a aac "$1-youtube.mkv"
}
