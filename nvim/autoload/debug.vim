function! debug#runtimepath() abort
  return &runtimepath->substitute(',', '\n', 'g')
endfunction
