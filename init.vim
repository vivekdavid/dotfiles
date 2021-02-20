

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kamykn/spelunker.vim'
Plug 'junegunn/goyo.vim'

call plug#end()

let g:airline_theme='base16_chalk'
colorscheme gruvbox

" goyo config

function! s:auto_goyo()
  if &ft == 'markdown'
    Goyo 100 
  else
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

augroup goyo_markdown
  autocmd!
  autocmd BufNewFile,BufRead * call s:auto_goyo()
augroup END

"end goyo config 

" spelunker config 

" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable

let g:enable_spelunker_vim = 1

" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
let g:enable_spelunker_vim_on_readonly = 1

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 3

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.html,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.html,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

" end of spelunker options

" setlocal spll
" set spelllang=en
" set spellsuggest?
set wrap linebreak nolist
set formatoptions=l
set hidden
" Make the gutter for numbers wider by default
set numberwidth=5
set display+=lastline
set clipboard=unnamedplus
set mouse=a
set ruler " Show the line and column numbers of the cursor.
set autoread
set noshowmode " Show current mode.
set encoding=utf-8 " Set default encoding to UTF-8
set incsearch " Shows the match while typing
set hlsearch " Highlight found searches
set ignorecase " Search case insensitive...
set smartcase " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab

"set gdefault " use g flag by default on searches
set number relativenumber

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
set mouse=a
"Here are things you will need to get this working:
"brew install bat
"brew install ripgrep
"you will also need to create a :CocConfig JSON with the following:     "suggest.noselect": false
" You will also want to run :CocInstall coc-snippets
"
"
" When setting up iTerm2 you can add a badge: https://stackoverflow.com/questions/38475154/set-title-and-badge-text-in-iterm
  