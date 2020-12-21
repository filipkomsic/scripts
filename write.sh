#!/bin/bash

setsid -f st -e nvim '/home/filip/dox/FAX/BP1/writing/draft/draft.tex' &
setsid zathura /home/filip/dox/FAX/BP1/writing/draft/draft.pdf 

