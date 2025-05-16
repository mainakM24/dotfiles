#!/bin/bash

current=$(brightnessctl | grep -o "(.*)" | tr -d "()")
echo "$current"
