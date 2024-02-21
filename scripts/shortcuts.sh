#!/usr/bin/env bash
set -ex

# qdirstat
cp /usr/share/applications/qdirstat.desktop /config/Desktop/
chown 1000:0 /config/Desktop/qdirstat.desktop

# krusader
cp /usr/share/applications/org.kde.krusader.desktop /config/Desktop/
chown 1000:0 /config/Desktop/org.kde.krusader.desktop
