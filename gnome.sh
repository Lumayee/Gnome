mkdir ~/.themes
mkdir /tmp/gnome

# download and install GTK theme
wget https://github.com/catppuccin/gtk/releases/download/v0.7.1/Catppuccin-Macchiato-Standard-Mauve-Dark.zip -P /tmp/gnome
unzip /tmp/gnome/Catppuccin-Macchiato-Standard-Mauve-Dark.zip -d .themes/

# GNOME terminal theme
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -
dconf write /org/gnome/terminal/legacy/profiles:/default "'5083e06b-024e-46be-9cd2-892b814f1fc8'"

# download and install icons and cursor
git clone https://github.com/vinceliuice/Colloid-icon-theme /tmp/gnome/Colloid-icon-theme
sh /tmp/gnome/Colloid-icon-theme/install.sh -s dracula -t purple
cd /tmp/gnome/Colloid-icon-theme/cursors/
./install.sh
cd

# remove tmp folder
rm -rf /tmp/gnome

# download wallpaper
curl -o ~/.themes/wallpaper.jpg https://raw.githubusercontent.com/makccr/wallpapers/master/wallpapers/abstract/Acrylic%20Paint%202.jpg

# GTK 4 config
mkdir -p "${HOME}/.config/gtk-4.0"
ln -sf "${HOME}/.themes/Catppuccin-Macchiato-Standard-Mauve-Dark//gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${HOME}/.themes/Catppuccin-Macchiato-Standard-Mauve-Dark//gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${HOME}/.themes/Catppuccin-Macchiato-Standard-Mauve-Dark//gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# gnome configuration
dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Macchiato-Standard-Mauve-Dark'"
gsettings set org.gnome.desktop.background picture-uri-dark ~/.themes/wallpaper.jpg
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Macchiato-Standard-Mauve-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Macchiato-Standard-Mauve-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Colloid-purple-dracula-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Colloid-cursors"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.shell.keybindings screenshot "['<Shift><Super>3']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Super>4']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Control><Super>q']"

dconf write /org/gnome/shell/extensions/dash-to-dock/hot-keys false
