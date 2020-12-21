#!/bin/bash

du -al ~/media/Renders | awk '{print }' | xargs sxiv -t -
