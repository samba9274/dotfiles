# dotfiles

## APT packages
```
thunar rofi feh i3blocks curl wget apt-transport-https dirmngr openssh-server gcc g++ default-jdk i3 xorg vim tmux lightdm slick-greeter i3lock compton scrot imagemagick snapd neofetch lxappearance ffmpeg obs-studio pulseaudio pavucontrol python3-pip gnome-screenshot firmware-linux firmware-linux-nonfree evince yarn transmission-gtk git handbrake nasm adb firefox-esr vlc
```

## Snap packages
```
core code fast node sublime-text postman scrcpy android-studio eclipse beekeeper-studio teams discord wazzapp pycharm-community eog
```

## Themes

GTK Theme : https://www.pling.com/p/1302313/

Cursor Theme : https://www.pling.com/p/1148692/

Icon Theme : https://www.pling.com/p/1279924/

## Slick greeter config

/etc/lightdm/slick-greeter.conf

```
[Greeter]
background=[home folder here]/.config/lockscreen.jpg
draw-grid=false
```

## Snap .desktop files
```bash
sudo ln -s /var/lib/snapd/desktop/applications /usr/share/applications/
```
