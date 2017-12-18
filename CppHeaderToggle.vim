function! s:cppToggleHeader()
    echom "hi"
    let b:ext = expand('%:e')
    let b:base = expand('%:r')
    "echo b:base

    if b:ext == 'hpp' || b:ext == 'h'
        let b:inlFile = b:base . '.inl'
        let b:cppFile = b:base . '.cpp'
        
        if filereadable(expand(b:inlFile))
            write
            execute "edit " . b:inlFile
        elseif filereadable(expand(b:cppFile))
            write
            execute "edit " . b:cppFile
        endif
    elseif b:ext == 'inl'
        let b:cppFile = b:base . '.cpp'
        let b:hppFile = b:base . '.hpp'
        let b:hFile = b:base . '.h'

        if filereadable(expand(b:cppFile))
            write
            execute "edit " . b:cppFile
        elseif filereadable(expand(b:hppFile))
            write
            execute "edit " . b:hppFile
        elseif filereadable(expand(b:hFile))
            write
            execute "edit " . b:hFile
        endif
    elseif b:ext == 'cpp'
        let b:hppFile = b:base . '.hpp'
        let b:hFile = b:base . '.h'

        if filereadable(expand(b:hppFile))
            write
            execute "edit " . b:hppFile
        elseif filereadable(expand(b:hFile))
            write
            execute "edit " . b:hFile
        endif
    endif
endfunction
command! CppToggleHeader call s:cppToggleHeader()

nmap <A-a> : CppToggleHeader<CR>
imap <A-a> <ESC>:CppToggleHeader<CR>
