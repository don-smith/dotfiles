# My instructions for setting up EndeavourOS-i3

## Install dotfiles

- Create an SSH key using the Password & Keys tool (F9 to open rofi, the app menu)

```sh
cd ~
mkdir projects; cd projects
git clone git@github.com:don-smith/dotfiles.git
```

## Install pamac

```sh
sudo pacman -Syyu base-devel
git clone https://aur.archlinus.org/pamac-aur.git ~/tempfolder
cd ~/tempfolder
makepkg -sic
```

## 
