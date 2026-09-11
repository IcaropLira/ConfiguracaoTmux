#!/usr/bin/env bash
set -e

CONFIG="$HOME/.tmux.conf"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "╔══════════════════════════════════════════╗"
echo "║       TMUX ÍCARO LIRA — INSTALLER       ║"
echo "╚══════════════════════════════════════════╝"
echo

if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux não encontrado."
    echo "Fedora: sudo dnf install tmux"
    exit 1
fi

if [ -f "$CONFIG" ]; then
    BACKUP="$HOME/.tmux.conf.backup.$(date +%Y%m%d-%H%M%S)"
    cp "$CONFIG" "$BACKUP"
    echo "✓ Backup criado: $BACKUP"
fi

cp "$SCRIPT_DIR/tmux.conf" "$CONFIG"
echo "✓ ~/.tmux.conf instalado"

if tmux info >/dev/null 2>&1; then
    tmux source-file "$CONFIG"
    echo "✓ Configuração recarregada"
else
    echo "✓ Abra uma sessão com: tmux"
fi

echo
echo "Prefixo: Ctrl+A"
echo "Ajuda:   Ctrl+A ?"
echo "Recarregar: Ctrl+A r"
echo
echo "TMUX Ícaro Lira instalado."
