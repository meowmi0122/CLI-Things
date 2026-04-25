#!/bin/bash

NUM_0=(" ████ " "█    █" "█    █" "█    █" "█    █" "█    █" " ████ ")
NUM_1=("   █  " "  ██  " "   █  " "   █  " "   █  " "   █  " " █████")
NUM_2=(" ████ " "     █" "     █" " ████ " "█     " "█     " "█████ ")
NUM_3=(" ████ " "     █" "     █" " ████ " "     █" "     █" " ████ ")
NUM_4=("█    █" "█    █" "█    █" "██████" "     █" "     █" "     █")
NUM_5=("█████ " "█     " "█     " "█████ " "     █" "     █" "█████ ")
NUM_6=(" ████ " "█     " "█     " "█████ " "█    █" "█    █" " ████ ")
NUM_7=("█████ " "     █" "    █ " "   █  " "  █   " "  █   " "  █   ")
NUM_8=(" ████ " "█    █" "█    █" " ████ " "█    █" "█    █" " ████ ")
NUM_9=(" ████ " "█    █" "█    █" " █████" "     █" "     █" " ████ ")
NUM_COLON=("      " "  ██  " "  ██  " "      " "  ██  " "  ██  " "      ")

render() {
    local text=$1
    for i in {0..6}; do
        line=""
        for ((j=0; j<${#text}; j++)); do
            c="${text:$j:1}"
            case $c in
                0) line+="${NUM_0[$i]}  " ;;
                1) line+="${NUM_1[$i]}  " ;;
                2) line+="${NUM_2[$i]}  " ;;
                3) line+="${NUM_3[$i]}  " ;;
                4) line+="${NUM_4[$i]}  " ;;
                5) line+="${NUM_5[$i]}  " ;;
                6) line+="${NUM_6[$i]}  " ;;
                7) line+="${NUM_7[$i]}  " ;;
                8) line+="${NUM_8[$i]}  " ;;
                9) line+="${NUM_9[$i]}  " ;;
                :) line+="${NUM_COLON[$i]}  " ;;
            esac
        done
        echo "$line"
    done
}

clock() {
    while true; do
        clear
        time=$(date +"%H:%M:%S")
        render "$time"
        sleep 1
    done
}

case "$1" in
    clock)
        clock
        ;;
    *)
        echo "Usage: cli clock"
        ;;
esac
