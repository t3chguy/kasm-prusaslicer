#!/usr/bin/env bash
set -ex

# download
curl --location https://github.com/qarmin/czkawka/releases/download/6.1.0/linux_czkawka_gui --output /usr/bin/linux_czkawka_gui
# mark as executable
chmod +x /usr/bin/linux_czkawka_gui

wget -q https://raw.githubusercontent.com/qarmin/czkawka/master/snap/gui/czkawka.png -O /opt/czkawka_icon.png

cat >/usr/share/applications/czkawka.desktop <<EOL
[Desktop Entry]
Version=1.1.1
Name=Czkawka
TryExec=/usr/bin/linux_czkawka_gui
Exec=/usr/bin/linux_czkawka_gui -- %u
Icon=/opt/czkawka_icon.png
Terminal=false
StartupWMClass=czkawka
Type=Application
EOL
chmod +x /usr/share/applications/czkawka.desktop
cp /usr/share/applications/czkawka.desktop /config/Desktop/czkawka.desktop

chown 1000:0 /config/Desktop/czkawka.desktop
