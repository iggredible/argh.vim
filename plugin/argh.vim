let g:arghCurrent = ""
let g:arghStore = {}

function! ArghController(sessionName)
  if empty(a:sessionName)
    call DisplayAllArghMenu()
    return
  endif

  if has_key(g:arghStore, a:sessionName)
    let g:arghStore[g:arghCurrent] = argv()

    call SwitchArgh(a:sessionName)
    return
  endif

  call PopulateArghStore(a:sessionName)
endfunction

function! UpdateArghCurrent(sessionName)
  let g:arghCurrent = a:sessionName
endfunction

function! SwitchArgh(sessionName)
  execute "%argdelete"
  for eachFile in g:arghStore[a:sessionName]
    execute "argadd " . eachFile
  endfor
  call UpdateArghCurrent(a:sessionName)
endfunction

function! PopulateArghStore(sessionName)
  let g:arghStore[a:sessionName] = argv()
  call UpdateArghCurrent(a:sessionName)
endfunction

function! AllArghMenuHandler(id, result)
  if a:result == -1
    return
  endif

  let l:arghAll = keys(g:arghStore)
  let l:arghIndex = a:result - 1
  let l:sessionName = l:arghAll[l:arghIndex]
  call SwitchArgh(l:sessionName)
endfunction

function! AddStarToArghCurrentMatch(key, val)
  if a:val ==# g:arghCurrent
    return a:val . "*"
  endif
  return a:val
endfunction

function! DisplayAllArghMenu()
  let l:arghAll = keys(g:arghStore)

  if empty(l:arghAll)
    call popup_create('¯\_(ツ)_/¯', #{ title: 'Empty Argh!',  highlight: 'Normal', border: [], close: 'click',  padding: [1,1,0,1], time: 1500})
    return
  endif

  call map(l:arghAll, function('AddStarToArghCurrentMatch'))
  call popup_menu(l:arghAll, #{ title: 'All Argh:', callback: 'AllArghMenuHandler', line: 25, col: 40, highlight: 'Question', border: [], close: 'click',  padding: [1,1,0,1]} )
endfunction

function! ArghAdd(sessionName)
  call PopulateArghStore(a:sessionName)
endfunction

function! ArghDelete(sessionName)
  if has_key(g:arghStore, a:sessionName)
    call remove(g:arghStore, a:sessionName)
    echo a:sessionName . " removed from Argh"
  endif
endfunction

command! -nargs=? Argh call ArghController('<args>')
command! -nargs=1 Argha call ArghAdd('<args>')
command! -nargs=1 Arghd call ArghDelete('<args>')

" TODO: upload to GH, check it in my repo. Make sure it works.
" TODO: write the article!

