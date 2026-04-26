import os
import time
import shutil
from datetime import datetime

NUMS = {
    "0": [" ████ ", "█    █", "█    █", "█    █", "█    █", "█    █", " ████ "],
    "1": ["   █  ", "  ██  ", "   █  ", "   █  ", "   █  ", "   █  ", " █████"],
    "2": [" ████ ", "     █", "     █", " ████ ", "█     ", "█     ", "█████ "],
    "3": [" ████ ", "     █", "     █", " ████ ", "     █", "     █", " ████ "],
    "4": ["█    █", "█    █", "█    █", "██████", "     █", "     █", "     █"],
    "5": ["█████ ", "█     ", "█     ", "█████ ", "     █", "     █", "█████ "],
    "6": [" ████ ", "█     ", "█     ", "█████ ", "█    █", "█    █", " ████ "],
    "7": ["█████ ", "     █", "    █ ", "   █  ", "  █   ", "  █   ", "  █   "],
    "8": [" ████ ", "█    █", "█    █", " ████ ", "█    █", "█    █", " ████ "],
    "9": [" ████ ", "█    █", "█    █", " █████", "     █", "     █", " ████ "],
    ":": ["      ", "  ██  ", "  ██  ", "      ", "  ██  ", "  ██  ", "      "]
}

def render(text):
    lines = [""] * 7
    for c in text:
        for i in range(7):
            lines[i] += NUMS[c][i] + "  "
    return lines

def draw_center(lines):
    size = shutil.get_terminal_size()
    rows, cols = size.lines, size.columns

    h = len(lines)
    w = max(len(l) for l in lines)

    top = max((rows - h) // 2, 0)
    left = max((cols - w) // 2, 0)

    os.system("clear")

    print("\n" * top, end="")
    for l in lines:
        print(" " * left + l)

def clock():
    while True:
        now = datetime.now().strftime("%H:%M:%S")
        lines = render(now)
        draw_center(lines)
        time.sleep(1)

if __name__ == "__main__":
    print("\033[?25l", end="")  # hide cursor
    try:
        clock()
    finally:
        print("\033[?25h", end="")  # restore cursor
        os.system("clear")
