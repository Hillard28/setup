#!/bin/bash
# Change boot logo
plymouth-set-default-theme -R igrt

# Reload fonts
fc-cache -vf
