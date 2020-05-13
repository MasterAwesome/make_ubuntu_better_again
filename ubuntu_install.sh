#/bin/bash
#   ubuntu_install.sh  Copyright (C) 2020 Arvind Mukund <armu30@gmail.com> 
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Installs all the essential packages.
echo "[*] Installing packages" 
sudo apt-get install -y neovim build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev git git-email gimp cmake clang clang-tools clang-format clang-tidy ruby gdb python3-dev python3-pip libglib2.0-dev libc6-dbg qemu qemu-system geany

# Installs libc one_gadget identifier.
echo "[*] Installing one_gadget"
sudo gem install one_gadget

# Installs custom gnome based accels shortcut
echo "[*] Installing terminal shortcuts"
./write_terminal_shortcut.sh

# Downloads and installs radare2 continous
echo "[*] Downloading radare2."
wget https://github.com/radareorg/radare2/releases/download/continuous/radare2-dev_4.5.0-git_amd64.deb -O radare2-dev.deb
wget https://github.com/radareorg/radare2/releases/download/continuous/radare2_4.5.0-git_amd64.deb -O radare2.deb
echo "[*] Installing radare2-dev"
sudo apt-get install ./radare2-dev.deb
echo "[*] Installing radare2"
sudo apt-get install ./radare2.deb

## AYYYY
echo "[.] ALL DONE! Enjoy this now decent linux distribution"

