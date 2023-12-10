# dotfiles
macOS에 적용 중인 dotfile 저장소


## tmux true color 설정
.zshrc 에 다음과 같이 설정
```
export TERM=screen-256color
alias tmux="tmux -2"
```
.tmux.conf에 다음과 같이 설정
```
set -g default-terminal "screen-256color"
set-option -sa terminal-feature ",screen-256color:RGB"
set-option -ga terminal-override ",screen-256color:Tc"
```

source ~/.zshrc
