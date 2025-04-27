#!/bin/bash 

##TODO:
##Automatically load configs files from here.
##It should work along with existings configurations

echo "Applying dotfiles from user"

cp vim/vimrc ~/.vimrc
cp tmux/tmux.conf ~/.tmux.conf


BASHRC="$HOME/.bashrc"
CONFIG_FILE="bashrc.bashrc.sh"
CONFIG_CONTENT=$(<"$CONFIG_FILE")

# Verifica si el contenido ya está en .bashrc
if grep -Fxq "$CONFIG_CONTENT" "$BASHRC"; then
    echo "Las configuraciones ya están en $BASHRC. No se hizo ningún cambio."
else
    echo -e "\n# Configuraciones añadidas automáticamente" >> "$BASHRC"
    cat "$CONFIG_FILE" >> "$BASHRC"
    echo "Configuraciones agregadas a $BASHRC."
fi

echo "Done"
