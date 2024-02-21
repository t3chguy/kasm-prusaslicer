#!/usr/bin/env bash
set -ex

curl -SsL https://api.github.com/repos/prusa3d/PrusaSlicer/releases/latest > $TMPDIR/latest.json

declare -A ARCH_MAP=( ["x86_64"]="x64" ["arm64"]="arm64")
URL=$(curl -SsL https://api.github.com/repos/prusa3d/PrusaSlicer/releases/latest | \
  jq --arg arch "${ARCH_MAP[$(arch)]}" \
  -r '.assets[] | select(.browser_download_url | test("linux-\( $arch )-GTK3.+.tar.bz2$"))| .browser_download_url')
wget -q "$URL" -O /tmp/prusaslicer.tgz

tar -xvf /tmp/prusaslicer.tgz -C /opt/
mv /opt/PrusaSlicer-* /opt/PrusaSlicer
rm -rf /tmp/prusaslicer.tgz

wget -q https://raw.githubusercontent.com/prusa3d/PrusaSlicer/master/resources/icons/PrusaSlicer.png -O /opt/PrusaSlicer/prusaslicer_icon.png

cat >/usr/share/applications/prusaslicer.desktop <<EOL
[Desktop Entry]
Version=2.6.0
Name=PrusaSlicer
TryExec=/opt/PrusaSlicer/prusa-slicer
Exec=/opt/PrusaSlicer/prusa-slicer -- %u
Icon=/opt/PrusaSlicer/prusaslicer_icon.png
Terminal=false
StartupWMClass=PrusaSlicerDesktop
Type=Application
EOL
chmod +x /usr/share/applications/prusaslicer.desktop
cp /usr/share/applications/prusaslicer.desktop /config/Desktop/prusaslicer.desktop

chown 1000:0 /config/Desktop/prusaslicer.desktop
