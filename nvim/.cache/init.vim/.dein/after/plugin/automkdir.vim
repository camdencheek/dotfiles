if exists("g:loaded_automkdir_after")
  finish
endif
let g:loaded_automkdir_after = 1

let s:save_cpo = &cpo
set cpo&vim

aug automkdir
    au!
    au BufWritePre * call automkdir#CreateCurrent()
aug END

let &cpo = s:save_cpo
unlet s:save_cpo
