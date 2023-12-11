" github.com/kuuote/autoload/vimrc/git.vimが参考
function! git#use(repo) abort
  let dir = '~/.cache/dpp/repos/github.com/'->expand() .. a:repo
  if !dir->isdirectory()
    execute '!git clone https://github.com/' .. a:repo dir
  endif
  execute 'set runtimepath^=' .. dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endfunction
