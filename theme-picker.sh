#!/usr/bin/env bash
# Seletor visual de temas do Tmux Ícaro — sem dependências além de bash e tmux.
set -euo pipefail
BASE="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-icaro"
THEME_FILE="$BASE/theme.conf"
mkdir -p "$BASE"

# nome|cor principal|cor de destaque|fundo da barra|fundo secundário|texto|muted
THEMES=(
  'Ícaro Red|colour196|colour203|colour234|colour237|colour255|colour245'
  'Ocean|colour39|colour51|colour233|colour236|colour255|colour245'
  'Forest|colour35|colour120|colour234|colour237|colour255|colour245'
  'Violet|colour135|colour213|colour234|colour237|colour255|colour245'
  'Amber|colour214|colour221|colour234|colour237|colour255|colour245'
  'Rose|colour168|colour218|colour235|colour238|colour255|colour246'
  'Nord|colour110|colour152|colour236|colour239|colour255|colour247'
  'Mono|colour250|colour255|colour232|colour235|colour255|colour245'
)

write_theme() {
  local name="$1" primary="$2" accent="$3" bg="$4" secondary="$5" fg="$6" muted="$7"
  cat > "$THEME_FILE" <<EOF
# Gerado pelo seletor de temas do Tmux Ícaro. Pode editar manualmente.
# Tema: $name
set -g @icaro_theme '$name'
set -g @icaro_primary '$primary'
set -g @icaro_accent '$accent'
set -g @icaro_bg '$bg'
set -g @icaro_secondary '$secondary'
set -g @icaro_fg '$fg'
set -g @icaro_muted '$muted'

# Barra moderna: identidade, janelas em pílulas e informações compactas.
set -g status-style "bg=$bg,fg=$fg"
set -g message-style "bg=$accent,fg=colour16,bold"
set -g message-command-style "bg=$secondary,fg=$accent"
set -g status-left "#[fg=colour16,bg=$accent,bold]  ◆ ÍCARO #[fg=$accent,bg=$bg]#[default] "
set -g status-left-length 30
set -g status-right-length 100
set -g window-status-separator ''
setw -g window-status-format "#[fg=$muted,bg=$bg]  #I  #[fg=$fg,bg=$secondary]#W #[default]"
setw -g window-status-current-format "#[fg=colour16,bg=$primary,bold]  #I  #W  #[fg=$primary,bg=$bg]#[default]"
set -g status-right "#[fg=$muted]#{?client_prefix,⌨ PREFIX ,}#[fg=$accent,bold] #{session_name} #[fg=$muted]│ #[fg=$fg]#{host_short} #[fg=$muted]│ #[fg=$accent,bold]%d %b  %H:%M #[default] "
set -g pane-border-style "fg=$secondary"
set -g pane-active-border-style "fg=$accent,bold"
set -g display-panes-active-colour $accent
set -g display-panes-colour $muted
set -g pane-border-format " #[fg=$accent,bold]#P #[fg=$muted]│ #[fg=$fg]#{pane_title} #[fg=$muted]· #{b:pane_current_path} "
EOF
  if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
    tmux source-file "$THEME_FILE"
    tmux display-message "Tema aplicado: $name"
  fi
  printf '\nTema aplicado: %s\nArquivo: %s\n' "$name" "$THEME_FILE"
}

printf '\n\033[1;38;5;51m╭──────────────────────────────────────╮\033[0m\n'
printf '\033[1;38;5;51m│       TMUX ÍCARO · APARÊNCIA          │\033[0m\n'
printf '\033[1;38;5;51m╰──────────────────────────────────────╯\033[0m\n\n'
for i in "${!THEMES[@]}"; do
  IFS='|' read -r name primary accent bg secondary fg muted <<< "${THEMES[$i]}"
  printf '  \033[38;5;%sm%2d  ●\033[0m  %-14s  \033[48;5;%sm  destaque  \033[0m\n' "${primary#colour}" "$((i+1))" "$name" "${accent#colour}"
done
printf '\n  0  Sair\n\n'
read -rp 'Escolha uma paleta [1-8]: ' choice
[[ "$choice" =~ ^[0-8]$ ]] || { echo 'Opção inválida.'; exit 1; }
[[ "$choice" == 0 ]] && exit 0
IFS='|' read -r name primary accent bg secondary fg muted <<< "${THEMES[$((choice-1))]}"
write_theme "$name" "$primary" "$accent" "$bg" "$secondary" "$fg" "$muted"
