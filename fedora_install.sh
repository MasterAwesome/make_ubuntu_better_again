#/bin/bash
#   fedora_install.sh  Copyright (C) 2020-2021 Arvind Mukund <armu30@gmail.com> 
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
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf group install "Development Tools" -y
sudo dnf install -y neovim openssl-devel git git-email \
gimp cmake clang clang-tools-extra ruby gdb python3-devel \
python3-pip qemu emacs hexedit nmap nasm curl patchelf \
radare2 radare2-devel latexmk texlive texlive-xetex \
texlive-collection-latexrecommended texlive-collection-science \
texlive-collection-xetex texlive-preprint texstudio libhid-devel \
strace ltrace libatomic gstreamer1-plugin-openh264 mozilla-openh264 \
openssl openssl-devel m4 ncurses-compat-libs ncurses-devel \
java-11-openjdk-devel java-11-openjdk iotop htop meld

# Multimedia
echo "[*] Installing multimedia codecs"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

# Installs libc one_gadget identifier.
echo "[*] Installing one_gadget"
sudo gem install one_gadget

pip3 install --user -r ./requirements.txt

# Linking vim to nvim
sudo ln -s /usr/bin/nvim /usr/bin/vim

## AYYYY
echo "[.] ALL DONE! Enjoy this now decent linux distribution"

