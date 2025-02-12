let tests = [
  \ {
  \   'title': '(branch / tag option) Available :CocCommand of coc.nvim',
  \   'prologue': '',
  \   'expected': 'exists(":CocCommand")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(do option) Available an executable of fzf',
  \   'prologue': '',
  \   'expected': 'executable(expand("<sfile>:p:h") . "/pack/jetpack/opt/_/bin/fzf")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(opt option) fzf.vim should be an opt package',
  \   'prologue': '',
  \   'expected': '!exists(":Files")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(opt option) fzf.vim should exist after packadd',
  \   'prologue': 'packadd fzf.vim',
  \   'expected': 'exists(":Files")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(for option) fzf-preview should not exist',
  \   'prologue': '',
  \   'expected': '!exists(":FzfPreviewGitFilesRpc")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(for option) fzf-preview should exist in lisp',
  \   'prologue': 'setf lisp',
  \   'expected': 'exists(":FzfPreviewGitFilesRpc")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(dir option and do option) skim should be instaled in /pack/skim',
  \   'prologue': '',
  \   'expected': 'executable(expand("<sfile>:p:h") . "/pack/skim/bin/sk")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(as option) dracula/vim should be installed as dracula',
  \   'prologue': '',
  \   'expected': 'isdirectory(expand("<sfile>:p:h") . "/pack/jetpack/src/dracula")',
  \   'epilogue': ''
  \ },
  \ {
  \   'title': '(rtp option) vlime/vlime',
  \   'prologue': 'setf lisp',
  \   'expected': 'filereadable(expand("<sfile>:p:h") . "/pack/jetpack/opt/_/addon-info.json")',
  \   'epilogue': ''
  \ },
  \ ]
let s:failed = 0

for test in tests
  call execute(test.prologue)
  if eval(test.expected)
    echon "\n[success] " . test.title
  else
    let s:failed = 1
    echon "\n[failed ] " . test.title
  endif
  call execute(test.epilogue)
endfor

if s:failed
  cquit
endif
