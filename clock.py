import os
import time
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

def render(text):
    for i in range(7):
        line = ""
        for c in text:
            if c in NUMS:
                line += NUMS[c][i] + "  "
        print(line)

def clock():
    while True:
        clear()
        now = datetime.now().strftime("%H:%M:%S")
        print(now)
        print("-" * 22)
        render(now)
        time.sleep(1)

if __name__ == "__main__":
    clock()
