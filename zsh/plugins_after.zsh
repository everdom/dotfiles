# External plugins (initialized after)

# Syntax highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Substring search
source ~/.zsh/plugins/history-substring-search/history-substring-search.zsh
# Auto suggestion
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# z quick jump plugin
source ~/.zsh/plugins/zsh-z.plugin.zsh
source ~/.zsh/plugins/sudo/sudo.plugin.zsh
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037,bold #,standout
    ZSH_HIGHLIGHT_STYLES[alias]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=064,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
    ZSH_HIGHLIGHT_STYLES[path]=fg=166,underline
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[assign]=fg=037
fi

# dircolors

# if [[ "$(tput colors)" == "256" ]]; then
#     eval $(dircolors =(cat ~/.shell/plugins/dircolors-solarized/dircolors.256dark ~/.shell/dircolors.extra))
# fi

# Choose spaceship prompt -- remain this for spaceship promt
# autoload -U promptinit; promptinit
# prompt spaceship

bindkey '\el' autosuggest-accept

# bindkey '\ep' history-search-backward
# bindkey '\en' history-search-forward
bindkey '\ep' history-substring-search-up
bindkey '\en' history-substring-search-down
