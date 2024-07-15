#!/bin/bash
# Install development tools
dnf install gcc clang llvm cmake -y

# Install languages
curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

. ~/.bashrc
. ~/.bash_profile

# Install RPM dev tools
dnf install rpm-build rpmdevtools createrepo_c -y

# Install github and login
dnf install 'dnf-command(config-manager)' -y
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install gh --repo gh-cli -y

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login

# Install MikTeX
rpm --import "https://miktex.org/download/key"
curl -L -o /etc/yum.repos.d/miktex.repo https://miktex.org/download/fedora/40/miktex.repo
dnf update -y
dnf install miktex -y
