#!/bin/bash

main=$(ls $HOME/.local/share/mail/filip@filipk.xyz/INBOX/new | wc -l)
gmail=$(ls $HOME/.local/share/mail/filipkomsic1@gmail.com/INBOX/new | wc -l)
unread=$((main+gmail))

echo "📮($unread)"

case $BLOCK_BUTTON in 
	1) setsid -f "$TERMINAL" -e neomutt ;;
	3) notify-send "Email" "Syncing..." --icon=/home/filip/media/icons/email.png ; mailupdate.sh ;;
esac
