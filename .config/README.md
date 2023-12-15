# dotfiles
macOS에 적용 중인 dotfile 저장소

------
### tmux true color 설정.
~/.tmux.conf에 다음과 같이 설정
```
set -g default-terminal "tmux-256color"
set-option -sa terminal-features ",xterm-256color:RGB"
set-option -ga terminal-overrides ",eterm-256color:Tc"
```

.zshrc 에 다음과 같이 설정
```
alias tmux="tmux -2"
```

~/.config/kitty/kitty.conf에 다음과 같이 설정
```
term        xterm-256color
```

source ~/.zshrc
termnial을 다시 실행하고, nvim에서 :checkhealth를 수행했을 때, 아래와 같은 결과가 나와야 한다.
![sshot1](doc/sshot1.png)

### kitty terminal 실행 시, tmux 자동 실행

~/.zshrc를 열고, 제일 마지막에 다음을 추가
```
[ -z "$TMUX" ] && command -v tmux &> /dev/null && tmux
```



### tmux에서 nvim 실행 시, insert mode에서 커서가 변경되지 않는 문제.

.tmux.conf에 다음을 추가한다.
```
set-option -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
```
tmux shell에서 tmux kill-server를 실행 한 후, 다시 tmux를 실행하면 적용됨.

------

### tmux 사용법 간단 정리.
- command prefix(ctrl-b)키를 누른 후에 다음 키를 누를 때는, command prefix를 누르고 있지 않아도 됨.
- 아래의 테이블에서 ctrl-b(command prefix)는 그냥 Prefix로 표현함
- pane은 tmux window의 분활된 화면(panel)을 의미

| 단축키              | 설명                                                        |
| ------------------- | ----------------------------------------------------------- |
| Prefix  %           | pane를 세로로 추가                                          |
| Prefix  "           | pane을 가로로 추가                                          |
| Prefix  {           | 현재 pane의 위치를 시계 방향으로 변경(swap)                 |
| Prefix  }           | 현재 pane의 위치를 반 시계 방향으로 변경(swap)              |
| Prefix  [space key] | 가로로 분할돤 pane을 세로로 변경 혹은 그 반대 경우로 toggle |
| Prefix  x           | 사용 중인 pane을 종료                                       |
| Prefix ?            | tmux의 단축키 help, 종료는 q                                |
| Prefix  방향키      | 커서를 해당 방향의 panel로 이동 (change focus)              |
