augroup AudoDisableIME
  autocmd!
  autocmd InsertLeave * silent! :!fcitx5-remote -c
augroup END
augroup ToggleRelativeNumber
  autocmd!
  autocmd CmdlineEnter * if &number |
        \ set norelativenumber | redraw |
        \ endif
  autocmd CmdlineLeave * if &number |
        \ set relativenumber |
        \ endif
augroup END

