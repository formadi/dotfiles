![screenshot1](doc/screenshot.jpg)


nvim 0.9.4 이상에서 확인
- 심플한 구조,
- plugin 관리를 용이하게 하기 위해 개별 파일로 구성 (Install, config, keymap).
- [cappuccin(Mocha)](https://github.com/catppuccin/nvim) 외 다수의 colors scheme 적용.
- 배경은 모두 투명처리 (배경색은 터미널 배경색)
- Normal 모드에서 ;(semi-colon) 키인으로 Command 모드 변경.
- 저장 시, 자동으로 Trailing whitespace 제거.
- DAP : rust, python, objc, swift
- leader 키 : space

------



### Themes

everforest
<details>
  <summary>everforest</summary>
  <img src="https://github.com/formadi/dotfiles/blob/main/.config/nvim/doc/everforest.png" alt="everforest">
</details>

![everforest](doc/everforest.png)

nord
![nord](doc/nord.png)

iceberg
![iceberg](doc/iceberg.png)

poimandres
![poimandres](doc/poimandres.png)

catppuccin
![catppuccin](doc/catppuccin.png)

vscode
![vscode](doc/vscode.png)





------

### Plugins
- 별도의 comment가 없는 것은 기본 키맵을 사용하는 것임.

[stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)
```
aerial 키맵
<leader>at : aerial toggle (right)
<leader>af : aerial toggle (float)

```
[ThePrimeagen/harpoon.nvim](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) - Harpoon2 branch
```
harpoon 키맵
<leader>ha : append
<leader>hr : remove
<leader>hc : remove all (clear)
<leader>hn : next
<leader>hp : previous
<leader>hq : quick menu
```
[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
```
lazygit 키맵
<leader>l : LazyGit
```
[mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
```
nvim-lint 키맵
<leader>ll : Trigger linting for current file
```

[nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim);
```
neo-tree 키맵
<leader>ef  : float
<leader>el  : left
<leader>er  : right
<leader>ee  : toggle
<leader>nc  : focus
<leader>eb  : current buffer's directory
```


[nvim-neorg/neorg](https://github.com/nvim-neorg/neorg)
```
neorg 키맵
<leader>nn  : Neorg (popup)
<leader>njt : Journal Today
<leader>njy : Journal Yesterday
<leader>njn : Journal Tomorrow
<leader>nc  : toggle concealer
<leader>ni  : goto index
<leader>ns  : generate summary
<leader>nkl : looking-glass
<leader>nkn : new note
<leader>nwm :    main workspace
<leader>nwn :   notes workspace
<leader>nwj : journal workspace
```

[3rd/image.nvim](https://github.com/3rd/image.nvim)    -- kitty terminal에서 nvim을 사용할 경우, markdown 문서, neorg 등에서 이미지를 표시.
```
# 필수 설치
brew install imagemagick luarocks lua51

# luarocks을 이용한 magick 설치
luarocks --local --lua-version=5.1 install magick

# 위의 magick 설치까지만 하면 정상적으로 동작해야 함.
# 만일 magick을 설치했음에도, 설치 하지 않았다는 오류가 발생한다면.. 아래의 dylib 설정을 시도 해 본다.
# dylib 설정
# imagemagick 버전에 따라 폴더명과 libMagicWand-****.dylib 파일명은 다를 수 있음
sudo ln -sv /opt/homebrew/Cellar/imagemagick/7.1.1-23/lib/libMagickWand-7.Q16HDRI.dylib /usr/local/lib/libMagickWand-7.Q16HDRI.dylib

# tmux를 사용하는 경우
# .tmux.conf 파일에 아래의 내용을 추가
set -gq allow-passthrough on
# .tmux.conf 파일을 저장한 후, shell 에서 tmux source ~/.tmux.conf 를 실행
```

[pocco81/true-zen.nvim](https://github.com/pocco81/true-zen.nvim)
```
zen mode 키맵
<leader>zz : toggle zen mode
<leader>zr : resize zen-window to 160
<leader>zi : increase zen-window size
<leader>zd : decrease zen-window size
```

[wojciech-kulik/xcodebuild.nvim](https://github.com/wojciech-kulik/xcodebuild.nvim)
```
Xcodebuild 키맵
<leader>xp : show menu
<leader>xb : build
<leader>xc : show config
<leader>xd : debug
<leader>xl : select project
<leader>xr : run
<leader>xs : setup

```
