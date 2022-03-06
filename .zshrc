pfetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select


# color
autoload -U colors && colors
alias 'ls=ls --color=auto'

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# path variable
export PATH=~/.config/emacs/bin/:$PATH
export PATH=~/.local/matlab/R2021b/bin/:$PATH
export PATH=~/.config/wireguard/connections/:$PATH

#aliases
source $HOME/.config/aliasrc

#other programs
[[ ! -f /usr/share/nvm/init-nvm.sh ]] || source /usr/share/nvm/init-nvm.sh --no-use

# set vim mode
bindkey -v


# load p10k config
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# zsh autosuggestion config
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUOSUGGEST_BUFFER_MAX_SIZET=30


# theme
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# kitty shell integration
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

# Plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh	# must come at end to ensure highlighting works all the time
