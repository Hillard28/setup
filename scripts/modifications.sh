#!/bin/bash
# Change boot logo
sudo plymouth-set-default-theme -R igrt

# Reload fonts
sudo fc-cache -vf
