#!/bin/bash
Xvfb :1 -screen 0 1024x768x24 &
DISPLAY=:1 /home/eclipse/eclipse -clean -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/juno -installIU org.eclipse.wst.web_ui.feature.feature.group
DISPLAY=:1 /home/eclipse/eclimd
