#!/bin/bash

trap 'tput cnorm; clear; exit' INT TERM EXIT
tput civis

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

render_lines() {
    local text=$1
    local out=()
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
        out[$i]="$line"
    done
    printf "%s\n" "${out[@]}"
}

while true; do
    if read -rsn1 -t 0.02 key; then
        break
    fi

    clear

    IFS=' ' read -r rows cols <<< "$(stty size)"

    mapfile -t lines < <(render_lines "$(date +"%H:%M:%S")")

    h=${#lines[@]}
    w=0
    for l in "${lines[@]}"; do
        (( ${#l} > w )) && w=${#l}
    done

    top=$(( (rows - h) / 2 ))
    left=$(( (cols - w) / 2 ))

    (( top < 0 )) && top=0
    (( left < 0 )) && left=0

    for ((i=0; i<top; i++)); do
        echo
    done

    for l in "${lines[@]}"; do
        printf "%*s%s\n" "$left" "" "$l"
    done
done

tput cnorm
clear
