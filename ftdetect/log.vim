augroup log_filetype_detection
  autocmd!
  autocmd BufNewFile,BufRead *.log setfiletype log
  autocmd BufNewFile,BufRead *_log setfiletype log
  autocmd BufNewFile,BufRead *.LOG setfiletype log
  autocmd BufNewFile,BufRead *_LOG setfiletype log
augroup END
