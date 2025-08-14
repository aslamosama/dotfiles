if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unsetopt PROMPT_SP BEEP
setopt glob_dots autocd always_to_end interactive_comments extended_glob multios
setopt extended_history inc_append_history share_history hist_ignore_space hist_verify hist_ignore_dups hist_find_no_dups hist_save_no_dups hist_reduce_blanks

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)
fpath=(~/.config/zsh/completions $fpath)

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zle_highlight=('paste:none')

function _zcompile_many() {
  for f in "$@"; do
    local zwc="${f}.zwc"
    [[ -f "$f" && (! -f "$zwc" || "$f" -nt "$zwc") ]] && zcompile -R -- "$zwc" "$f"
  done
}
_zcompile_many ~/.config/{shell/{aliasrc,fzf,exports},zsh/.{p10k{,-tty}.zsh,zcompdump}}
unfunction _zcompile_many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/plugins/fzf-tab-source/fzf-tab.plugin.zsh
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/find-the-command/usr/share/doc/find-the-command/ftc.zsh
source ~/.config/zsh/plugins/sudo/sudo.plugin.zsh
source ~/.config/shell/aliasrc
source ~/.config/shell/fzf
source ~/.config/shell/exports

if [[ -t 1 && "$(tty)" == /dev/tty([0-9]) && -z $DISPLAY && -z $WAYLAND_DISPLAY ]]; then
  source ~/.config/zsh/.p10k-tty.zsh
else
  source ~/.config/zsh/.p10k.zsh
fi

bindkey -e
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^E' edit-command-line
bindkey '^H' backward-kill-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC" &>/dev/null

echo -ne '\e[3 q'
preexec() { echo -ne '\e[3 q' }
