# TMUX Ícaro Lira

Configuração portátil e completa do tmux para Fedora/Linux.

## Instalação

```bash
./install.sh
```

O instalador faz backup do `~/.tmux.conf` existente.

## Prefixo

O prefixo padrão foi alterado de `Ctrl+B` para:

```text
Ctrl+A
```

## Atalhos principais

### Painéis

| Atalho | Ação |
|---|---|
| `Ctrl+A \|` | dividir verticalmente |
| `Ctrl+A -` | dividir horizontalmente |
| `Ctrl+A h/j/k/l` | navegar |
| `Alt + setas` | navegar sem prefixo |
| `Ctrl+A H/J/K/L` | redimensionar |
| `Alt+Shift+setas` | redimensionar |
| `Ctrl+A z` | maximizar/restaurar |
| `Ctrl+A Space` | próximo layout |
| `Ctrl+A x` | fechar painel |
| `Ctrl+A q` | sincronizar/desincronizar painéis |

### Janelas

| Atalho | Ação |
|---|---|
| `Ctrl+A c` | nova janela no diretório atual |
| `Ctrl+A Tab` | última janela |
| `Ctrl+A n` | próxima |
| `Ctrl+A p` | anterior |
| `Ctrl+Shift+←/→` | trocar janela |
| `Ctrl+A ,` | renomear janela |
| `Ctrl+A 1..9` | ir para janela |

### Geral

| Atalho | Ação |
|---|---|
| `Ctrl+A r` | recarregar configuração |
| `Ctrl+A ?` | abrir central de ajuda |
| `Ctrl+A d` | detach |
| `Ctrl+A [` | copy mode |
| `Ctrl+Shift+Space` | mostrar/esconder barra |

## Copy mode

O copy mode usa teclas estilo Vim:

```text
Esc       entrar
v         iniciar seleção
Ctrl+V    seleção retangular
y         copiar
Esc       cancelar
```

## Visual

A barra inferior mostra:

```text
TMUX ÍCARO LIRA | janelas | sessão | host | data | hora
```

O painel ativo fica destacado e cada painel mostra seu número, título e diretório.

## Filosofia

- Sem plugins obrigatórios.
- Funciona em instalação limpa de Fedora.
- Adequado para computadores de laboratório.
- Configuração concentrada em um único `~/.tmux.conf`.
- Backup automático durante instalação.
# ConfiguracaoTmux
# ConfiguracaoTmux
# ConfiguracaoTmux
# ConfiguracaoTmux
# ConfiguracaoTmux
# ConfiguracaoTmux
