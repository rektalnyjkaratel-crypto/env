" ~/.vimrc

" Основные настройки
set nocompatible

" Настройки курсора - линия в режиме ввода
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
endif

" Альтернативный способ для курсора (для разных терминалов)
if &term =~ "xterm\\|rxvt"
    " Курсор в режиме вставки - вертикальная линия (6)
    let &t_SI = "\<Esc>[6 q"
    " Курсор в нормальном режиме - блок (2)
    let &t_EI = "\<Esc>[2 q"
    " Курсор в режиме замены - подчеркивание (4)
    let &t_SR = "\<Esc>[4 q"
endif

" Базовые настройки редактора
syntax enable                 " Подсветка синтаксиса
filetype plugin indent on    " Определение типа файла

set number                   " Номера строк
set relativenumber           " Относительные номера строк
set tabstop=4                " Ширина табуляции
set shiftwidth=4             " Ширина отступа
set expandtab                " Использовать пробелы вместо табов
set smartindent              " Умные отступы
set autoindent               " Автоотступы

set nowrap                   " Не переносить строки
set cursorline               " Подсветка текущей строки
set showmatch                " Подсветка matching brackets
set incsearch                " Инкрементальный поиск
set hlsearch                 " Подсветка результатов поиска
set ignorecase               " Игнорировать регистр при поиске
set smartcase                " Умный регистр

set backspace=indent,eol,start " Правильное поведение backspace
set encoding=utf-8           " Кодировка UTF-8
set fileencoding=utf-8

set hidden                   " Переключаться между буферами без сохранения
set history=1000             " История команд

set laststatus=2             " Всегда показывать статус бар
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]

set wildmenu                 " Автодополнение в командной строке
set wildmode=longest:full,full

set scrolloff=5              " Минимальное количество строк вокруг курсора
set sidescrolloff=5

" Авто-команды
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" Цветовая схема
" colorscheme desert           " Встроенная цветовая схема
set background=dark

" Настройки мыши
set mouse=a                  " Включить мышь во всех режимах

" Настройки переноса длинных строк
set linebreak                " Перенос по словам, а не по символам

" Отключить резервные файлы
set nobackup
set nowritebackup
set noswapfile

" Быстрое переключение между буферами
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
