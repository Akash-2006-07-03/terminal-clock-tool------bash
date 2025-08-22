#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"


clock() {
	trap 'return' INT
	while true ; do
	clear
	HOUR=$(date +%H)
	MIN=$(date +%M)
	SEC=$(date +%S)
	echo -e "${GREEN}$HOUR${RESET}:${BLUE}$MIN${RESET}:${RED}$SEC${RESET}   (press ctrl+c to return to menu)"
	echo 
	echo -e "${YELLOW}Date:${RESET} $(date '+%A, %d %B %Y')"
	echo -e "${YELLOW}CPU:${RESET} $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')% ${YELLOW}RAM:${RESET} $(free -h | awk '/Mem/{print $3 "/" $2}')"	
	sleep 1
	done
}

stopwatch() {
	clear
	echo -e "${BLUE}Stopwatch (press ctrl + c to stop) ${RESET}"
	SECONDS=0

	trap 'echo ; echo -e "\n${YELLOW}Total time waited: ${GREEN}$((SECONDS/3600))h $((SECONDS/60%60))m $((SECONDS%60))s ${RESET}" ; sleep 2 ; return ' INT
	
	START=$SECONDS
	while true ; do
	ELAPSED=$((SECONDS - START))
	printf "\rTime: %02d:%02d:%02d" \
		$((ELAPSED/3600)) $((ELAPSED/60%60)) $((ELAPSED%60))
	sleep 1
	done
}

timer() {
	clear
	trap 'echo; echo "Returning to menu..."; return' INT
	read -p "Enter Seconds for countdown: " SEC
	while [[ $SEC -gt 0 ]] ; do
	printf "\rRemaining time: %02d:%02d" $((SEC/60%60)) $((SEC%60))
	sleep 1
	((SEC--))
	done
	clear
	echo -e "\n${RED}Time Up!!!${RESET}" && paplay /usr/share/sounds/freedesktop/stereo/complete.oga
}


worldclock() {
	clear
	trap 'echo; echo "Returning to menu..."; return' INT
	echo -e "${YELLOW}World Clock${RESET}"
	echo "India:      $(TZ=Asia/Kolkata date +%T)"
	echo "NewYork:    $(TZ=America/New_York date +%T)"
	echo "London:     $(TZ=Europe/London date +%T)"
	echo "Tokyo:      $(TZ=Asia/Tokyo date +%T)"
	echo
	read -p "Press enter to return to menu...."
}


alarm() {
	clear
	trap 'echo; echo "Returning to menu..."; return' INT
	read -p "Enter alarm time (HH:MM format): " ATIME
	ATIME=$(date -d "$ATIME" +%H:%M 2>/dev/null)
	
	if [[ -z "$ATIME" ]]; then
		echo "Invalid time format. Please use HH:MM."
		exit 1
	fi

	echo "Alarm set for $ATIME"

	while  true; do
		NOW=$(date +%H:%M)

		if [[ "$NOW" == "$ATIME" ]]; then
			echo -e "\n${RED}ALARM! Wake up!${RESET}"
			for i in {1..5}; do
				paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null
				sleep 1
			done
			break
		fi
	sleep 1
	done
}


while true; do
	clear
	trap 'echo; echo -e "Use the menu options to navigate\nEnter the Option: ";' INT
	echo -e "${BLUE}======Terminal Clock Tool=======${RESET}"
	echo "1) Clock"
	echo "2) StopWatch"
	echo "3) Timer"
	echo "4) WorldClock"
	echo "5) Alarm"
	echo "6) exit"

	read -p "Choose an option " CH

	case $CH in
		1) clock ;;
		2) stopwatch ;;
		3) timer ;;
		4) worldclock ;;
		5) alarm ;;
		6) exit 0 ;;
		*) echo "Invalid choice!!! Try again."; sleep 1 ;;
	esac
done
 
 
