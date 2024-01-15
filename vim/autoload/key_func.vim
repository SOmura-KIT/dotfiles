function! key_func#customJ() abort
  if v:count1 == 1
    return 'gj'
  endif
  return 'j'
endfunction

function! key_func#customK() abort
  if v:count1 == 1
    return 'gk'
  endif
  return 'k'
endfunction
