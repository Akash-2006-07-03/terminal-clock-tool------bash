# terminal-clock-tool------bash

A simple Bash-based terminal utility that provides multiple time-related features like a digital clock, stopwatch, timer, world clock, and alarm — all inside your Linux terminal.

<h3>✨ Features</h3>

Clock 🕒 – Displays the current time, date, CPU usage, and RAM usage in real-time.

Stopwatch ⏱ – A running stopwatch with hours, minutes, and seconds.

Timer ⌛ – Set a countdown timer in seconds, with an alert sound when time is up.

World Clock 🌍 – View the current time in multiple cities (India, New York, London, Tokyo).

Alarm 🔔 – Set an alarm at a specific time (HH:MM format) with sound notifications.

<h3>📦 Requirements</h3>

Make sure you have:

Bash (default in most Linux distributions)

paplay command (part of pulseaudio-utils) for sound alerts

sudo apt install pulseaudio-utils


Basic Linux utilities: date, awk, free, top

<h3>🚀 Usage</h3>

Save the script to a file, e.g. clock_tool.sh.

Give it execute permission:

chmod +x clock_tool.sh


<h3>Run the script:</h3>

./clock_tool.sh

<h3>📖 Menu Options</h3>

Once you run the script, you’ll see a menu like this:

======Terminal Clock Tool=======
1) Clock
2) StopWatch
3) Timer
4) WorldClock
5) Alarm
6) Exit

<h3>Controls</h3>

Clock → Press Ctrl + C to return to the menu.

Stopwatch → Press Ctrl + C to stop and show total elapsed time.

Timer → Enter the number of seconds for countdown.

World Clock → Press Enter to return to menu.

Alarm → Enter time in HH:MM format.

<h3>🔊 Sound Alerts</h3>

The timer and alarm use:

/usr/share/sounds/freedesktop/stereo/complete.oga


You can replace this path with any .oga or .wav file on your system for custom sounds.
