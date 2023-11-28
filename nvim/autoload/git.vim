" github.com/kuuote/autoload/vimrc/git.vimが参考
function! g:git#use(repo) abort
  let l:home = getenv('HOME')
  let l:path = l:home .. '/.cache/dpp/repos/' .. a:repo->substitute('.*://', '', '')
  if !isdirectory(l:path)
    execute printf('!git clone %s %s', a:repo, l:path)
  endif
  execute 'set runtimepath^=' .. l:path
endfunction
