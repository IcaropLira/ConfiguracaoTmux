# Tmux Ícaro — edição visual

Uma configuração independente para tmux, com barra de status renovada, bordas destacadas, informações úteis e seletor de cores interativo. Não exige plugins, Nerd Font ou `fzf`.

## Instalar só o tmux

```bash
chmod +x install.sh
./install.sh                 # detecta se pode usar sudo
./install.sh --user          # instalação sem sudo
./install.sh --system        # usa o gerenciador de pacotes do sistema
```

O instalador faz backup de `~/.tmux.conf`, instala o seletor em `~/.config/tmux-icaro/` e preserva o tema escolhido nas próximas sessões.

## Escolher cores

Dentro do tmux, pressione **Ctrl+A** e depois **T**. Também pode executar:

```bash
~/.config/tmux-icaro/theme-picker.sh
```

Paletas incluídas: **Ícaro Red**, Ocean, Forest, Violet, Amber, Rose, Nord e Mono. A troca é aplicada na sessão ativa e gravada para continuar depois de reiniciar.

## Personalização

O arquivo `~/.config/tmux-icaro/theme.conf` é gerado pelo seletor. É possível ajustar as cores `colour0`–`colour255`, além de editar os formatos `status-left`, `status-right`, `window-status-format` e `pane-border-format`. Recarregue com **Ctrl+A r**.

## Visual e atalhos

- Barra inferior com nome do tema, sessão, host, data e hora.
- Janela atual com contraste forte; janelas inativas com fundo secundário.
- Borda do painel ativo destacada pela cor de acento.
- Identificação de painel, título e diretório no cabeçalho do painel.
- Prefixo **Ctrl+A**, mouse, histórico de 50 mil linhas e copy-mode estilo Vim.
- **Ctrl+A T**: seletor de temas; **Ctrl+A ?**: ajuda; **Ctrl+A r**: recarregar.
- **Ctrl+Shift+Space**: mostrar/ocultar a barra.

Os glifos decorativos usam caracteres Unicode simples. Se o terminal não tiver uma fonte compatível, troque `` por `|` nos formatos da barra.

## Dependências

- Bash e tmux.
- Para instalar o tmux automaticamente sem sudo, o instalador pode precisar de `curl` e `tar` e de acesso à internet.
