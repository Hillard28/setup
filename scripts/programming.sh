#!/bin/bash
# Install development tools
sudo dnf install gcc clang llvm cmake -y

# Install languages
curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

. ~/.bashrc
. ~/.bash_profile

# Install RPM dev tools
sudo dnf install rpm-build rpmdevtools createrepo_c -y

# Install MikTeX
sudo rpm --import "https://miktex.org/download/key"
sudo curl -L -o /etc/yum.repos.d/miktex.repo https://miktex.org/download/fedora/40/miktex.repo
sudo dnf update -y
sudo dnf install miktex -y

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install code # or code-insider

# Install github and login
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli -y

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login
