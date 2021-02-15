## neovim

- neovim 0.5 버전 이상
- 환경변수 설정

## vscode

- neovim 플러그인 설치
- vscodevim 플러그인 삭제
- neovim 위치 설정
```
"vscode-neovim.neovimExecutablePaths.win32": "C:\\tools\\neovim\\Neovim\\bin\\nvim.exe",
```
- init.vim 설정은 그대로.
  - 하지만 vscode에서 안쓰이는 설정은 `if !exists('g:vscode')`로 묶어주는 것을 권장
- jj <Esc> 매핑은 vscode 내에서 해야함
```
    {
        "command": "vscode-neovim.compositeEscape1",
        "key": "j",
        "when": "neovim.mode == insert && editorTextFocus",
        "args": "j"
    }
```
