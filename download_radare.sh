#/bin/bash
#   download_radare.sh  Copyright (C) 2020 Arvind Mukund <armu30@gmail.com> 
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

URL="https://github.com/radareorg/radare2/releases/tag/continuous" 
FILES="$(curl $URL -s | egrep "href.*deb" | cut -d'"' -f2)"
PREFIX="https://github.com"
idx=0
for file in $FILES;
do
	echo "[*] Downloading $file."
	OUT="radare$idx.deb"
	wget "$PREFIX$file" -O "$OUT"
	echo "[*] Installing $file"
	sudo apt-get install "./$OUT" -y
	echo "[.] Installed $file; Cleaning up"
	rm "$OUT"
	idx=$(($idx+1))
done

