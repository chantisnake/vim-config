" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"" auto start latex preview
"autocmd VimEnter * LLPStartPreview

set dictionary+=~/vimfiles/ftplugin/tex/dictionary/SIunits
set dictionary+=~/vimfiles/ftplugin/tex/dictionary/amsfont
set dictionary+=~/vimfiles/ftplugin/tex/dictionary/amssymb
set dictionary+=~/vimfiles/ftplugin/tex/dictionary/braket
set dictionary+=~/vimfiles/ftplugin/tex/dictionary/dictionary
set dictionary+=~/vimfiles/ftplugin/tex/dictionary/myDict
set dictionary+=~/vimfiles/ftplugin/tex/dictionary/upgreek

" map notations
call IMAP('ve{', '\vect{<++>}<++>', 'tex')
call IMAP('df{', '\dfrac{<++>}{<++>}<++>', 'tex')
call IMAP('de{', '\deri{<++>}{<++>}<++>', 'tex')
call IMAP(' * ', ' \times ', 'tex')
call IMAP(' . ', ' \cdot ', 'tex')
call IMAP('(', '(<++>)<++>', 'tex')
call IMAP('[', '[<++>]<++>', 'tex')
call IMAP('{', '{<++>}<++>', 'tex')
call IMAP('$', '$ <++> $<++>', 'tex')
call IMAP('((', '\<C-j>\<BS>\<BS> \left( <++> \right)', 'tex')
call IMAP('EFI', '\begin{figure}[<+htpb+>]\<CR>\centering<CR>\includegraphics[height=2in]{<+eps file+>}<CR>\caption{<+caption text+>}<CR>\label{fig:<+label+>}<CR>\end{figure}<++>', '')
