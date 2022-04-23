#!/bin/sh
pacmd set-default-sink jack_out &&
jack_control start
jack_control ds alsa
jack_control dps device hw:USB
jack_control dps rate 44100
jack_control dps nperiods 2
jack_control dps period 512
#pacmd set-default-sink jack_out
sleep 5
#a2jmidid -e & sleep 2 && pulseaudio --start
#a2j_control --ehw
#a2j_control --start
qjackctl &
