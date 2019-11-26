#!/bin/bash
# A Simple shell script to append some text into a file
# By Marco De Jesus. Score me high please :D
FILE=/home/mdejesus/shell-script/appender.txt

<<COMMENT
	The intention of this function
	is to pick whatever option the user has picked
	and set the variable to that so it can be appended 
	to the file.
COMMENT

function getNewTextToAppend(){
	textToAppend=""

	case "$1" in
		1) textToAppend="Start"
		;;
		2) textToAppend="Stop"
		;;
		3) textToAppend="Restart"
		;;
	esac
}

while true; do
	echo "Hey User! please enter any... you know what to do, don't make it hard:"
	echo "1. Start"
	echo "2. Stop"
	echo "3. Restart"
	echo "4. I don't like this, take me out please!!!!"

	read OPTION

	if (("$OPTION" >= "1")) && (("$OPTION" <= "3")); then

		getNewTextToAppend "$OPTION"

		if [ -f "$FILE" ]; then
			echo "There a file already in place with the same name but your text has been appended."
			echo $textToAppend >> $FILE
		else
			echo "Indeed the fila has been created."
			echo "C'mon friend don't be naive ;). I told you the truth, the file was created." > $FILE
			echo $textToAppend >> $FILE
		fi
	elif [ $OPTION == "4" ] ; then
		echo "You souldn't play what you're not willing to enjoy :@"
		break
	else
		echo "I told you, make it easy dude!!!"
	fi
done

echo "You got bored huh! ok bye."
