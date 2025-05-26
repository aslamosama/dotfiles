if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unsetopt PROMPT_SP
setopt extended_history inc_append_history share_history hist_ignore_space hist_verify hist_ignore_dups hist_find_no_dups hist_save_no_dups
setopt glob_dots autocd always_to_end interactive_comments extended_glob multios

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

function _zcompile_many() {
  for f in "$@"; do
    local zwc="${f}.zwc"
    [[ -f "$f" && (! -f "$zwc" || "$f" -nt "$zwc") ]] && zcompile -R -- "$zwc" "$f"
  done
}
_zcompile_many ~/.config/shell/aliasrc ~/.config/zsh/.{p10k{,-ascii-8color}.zsh,zcompdump}
unfunction _zcompile_many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/plugins/fzf-tab-source/fzf-tab.plugin.zsh
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/find-the-command/usr/share/doc/find-the-command/ftc.zsh
source ~/.config/zsh/plugins/sudo/sudo.plugin.zsh
source ~/.config/shell/aliasrc

if [[ -t 1 && "$(tty)" == /dev/tty([0-9]) && -z $DISPLAY && -z $WAYLAND_DISPLAY ]]; then
  source ~/.config/zsh/.p10k-ascii-8color.zsh
else
  source ~/.config/zsh/.p10k.zsh
fi
if [[ -f "$HOME/.cache/light_mode" ]]; then
  source ~/.config/shell/fzf/tokyonight-day
else
  source ~/.config/shell/fzf/tokyonight-night
fi

bindkey -e
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^E' edit-command-line
bindkey '^H' backward-kill-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

echo -ne '\e[3 q'
preexec() { echo -ne '\e[3 q' }
