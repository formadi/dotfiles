# dotfiles
macOS에 적용 중인 dotfile 저장소

------
### tmux true color 설정
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



### tmux에서 nvim 실행 시, insert mode에서 커서가 변경되지 않는 문제

.tmux.conf에 다음을 추가한다.
```
set-option -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
```
tmux shell에서 tmux kill-server를 실행 한 후, 다시 tmux를 실행하면 적용됨.

------

### tmux 사용법 간단 정리

| ctrl-b               | command trigger                                              |
| -------------------- | ------------------------------------------------------------ |
| ctrl-b + %           | panel를 세로로 추가                                          |
| ctrl-b + "           | panel을 가로로 추가                                          |
| ctrl+b + {           | panel의 위치를 변경 - 시계 방향                              |
| ctrl+b + }           | panel의 위치를 변경 - 반 시계 방향                           |
| ctrl-b + [space key] | 가로로 분할돤 panel을 세로로 변경 혹은 그 반대 경우로 toggle |
| option + 방향키      | 커서를 해당 방향의 panel로 이동 (change focus)               |

