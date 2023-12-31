export LANG=ko_KR.UTF-8

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
                                                  || source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/highlighters" ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters \
                                                                  || export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
                                                  || source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PAGER="most"
export EDITOR='nvim'
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump web-search)

source $ZSH/oh-my-zsh.sh

export "MICRO_TRUECOLOR=1"
alias cr="clear"
alias ll="ls -al"
alias con="cd ~/.config"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias m="micro"
alias cdxp="cd /Volumes/Kali/_xcode_projects"   # change directory xcode projects
alias ls="exa"
alias ll="exa -lah"
alias la="exa -a"
alias lt="exa -aT -L1  --color=always --group-directories-first --icons"
alias lt2="exa -aT -L2 --color=always --group-directories-first --icons"
alias lt3="exa -aT -L3 --color=always --group-directories-first --icons"
alias cat="bat"
alias calendar="calcurse -D /Volumes/Kali/calcurse"
alias b="brew"
alias cd="z"
# alias rm="rip"
alias suri="cd /Volumes/Kali/suri_project"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

# autorun tmux at terlinal launch
tmux source ~/.tmux.conf
[ -z "$TMUX" ] && command -v tmux &> /dev/null && tmux

# default directiory
cd ~/.config/nvim
