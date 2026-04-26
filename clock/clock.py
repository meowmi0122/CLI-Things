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

def clear():
    os.system("cls" if os.name == "nt" else "clear")

def render_lines(text):
    lines = [""] * 7
    for c in text:
        if c in NUMS:
            for i in range(7):
                lines[i] += NUMS[c][i] + "  "
    return lines

def center_print(lines):
    size = shutil.get_terminal_size()
    rows, cols = size.lines, size.columns

    h = len(lines)
    w = max(len(l) for l in lines)

    top = max((rows - h) // 2, 0)
    left = max((cols - w) // 2, 0)

    print("\n" * top, end="")
    for line in lines:
        print(" " * left + line)

def clock():
    while True:
        clear()
        now = datetime.now().strftime("%H:%M:%S")
        lines = render_lines(now)
        center_print(lines)
        time.sleep(1)

if __name__ == "__main__":
    clock()
