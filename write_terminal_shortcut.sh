#!/bin/bash
#   Copyright (C) 2020 Arvind Mukund <armu30@gmail.com>
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

# Directory setup
DIR="$HOME/.local/share/nautilus/scripts"
ACCELS_PATH="$HOME/.config/nautilus/scripts-accels"
CONTAINS_TERM_SHORT=$(cat $ACCELS_PATH | grep terminal | wc -l)
# Directory setup end.

echo "Generating directories [1/4]"
mkdir -p $DIR
echo "Writing to $DIR/terminal [2/4]"
cat << EOF > "$DIR/terminal"
#!/bin/sh
######################################################################
# Description: Launches Terminal in the current nautilus folder      #
# Created Wed 13 May 2020 07:55:45 PM UTC                            #
# Uses: Default gnome-terminal.                                      #
# Working: Nautilus pases to script current working directory.       #
######################################################################
gnome-terminal

EOF


# Linking the script to a keyboard shortcut.
echo "Written to $DIR/terminal..."
echo "Updating permissions to 0755 on $DIR/terminal"
chmod +x "$DIR/terminal"
echo "Writing shortcuts to $ACCELS_PATH [3/4]"
if [[ $CONTAINS_TERM_SHORT -le 0 ]]; then
	echo "F4 terminal" >> $ACCELS_PATH
fi
echo "Restarting nautilus [4/4]"

# Restarting nautilus.
nautilus -q
