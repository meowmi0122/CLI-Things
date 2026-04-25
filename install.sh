#!/bin/bash

set -e

echo "📦 Installing CLI Tools..."

# 安裝位置（使用者家目錄，不用 sudo）
INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

# 複製 cli 主程式
cp ./cli "$INSTALL_DIR/cli"

# 🔥 一鍵給權限（重點）
chmod 755 "$INSTALL_DIR/cli"

# 加 PATH（如果沒有）
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
    echo 'export PATH=$PATH:$HOME/.local/bin' >> "$HOME/.bashrc"
    echo 'export PATH=$PATH:$HOME/.zshrc' 2>/dev/null || true
fi

echo "✅ Installed successfully!"
echo "👉 Run: source ~/.bashrc (or reopen terminal)"
echo "👉 Then use: cli clock"
