# dotfiles
macOS에 적용 중인 dotfile 저장소

------
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
termnial을 다시 실행하고, nvim에서 :checkhealth를 수행했을 때, 아래와 같은 결과가 나와야 한다.
![sshot1](doc/sshot1.png)

------
## tmux에서 nvim 실행 시, insert mode에서 커서가 변경되지 않는 문제
.tmux.conf에 다음을 추가한다.
```
set-option -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
```
tmux shell에서 tmux kill-server를 실행 한 후, 다시 tmux를 실행하면 적용됨.
