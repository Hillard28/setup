#!/bin/bash
# Install multimedia
dnf swap ffmpeg-free ffmpeg --allowerasing
dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf install @sound-and-video -y
