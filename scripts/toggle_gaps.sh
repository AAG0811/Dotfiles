#!/bin/bash

DEFAULT_GAP=5
GAPS_OUT=10
# Get the gaps_in custom type values
gap_values=$(hyprctl getoption general:gaps_in | awk '/custom type:/ {print $3, $4, $5, $6}')

# If parsing fails, exit
if [[ -z "$gap_values" ]]; then
    echo "Error: could not parse gaps_in"
    exit 1
fi

# Split values into array
read -r top right bottom left <<< "$gap_values"

# Check if all gaps are 0
if [[ "$top" -eq 0 && "$right" -eq 0 && "$bottom" -eq 0 && "$left" -eq 0 ]]; then
    # Turn gaps ON
    hyprctl keyword general:gaps_in "$DEFAULT_GAP $DEFAULT_GAP $DEFAULT_GAP $DEFAULT_GAP"
    hyprctl keyword general:gaps_out "$GAPS_OUT"
else
    # Turn gaps OFF
    hyprctl keyword general:gaps_in "0 0 0 0"
    hyprctl keyword general:gaps_out "0"
fi

