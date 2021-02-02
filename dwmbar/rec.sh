#!/bin/sh

pgrep ffmpeg >/dev/null && echo "🔴" || echo ""
