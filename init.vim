" Use Vim-plug for plugin management
call plug#begin('~/.config/nvim/plugged')

" Syntax Highlighting
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'hrsh7th/nvim-compe'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'BurntSushi/ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'gruvbox-community/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'hrsh7th/vim-vsnip'
Plug 'sbdchd/neoformat'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


'
" Copy to system clipboard
set clipboard+=unnamedplus
let mapleader = ","


" Other good development plugins
Plug 'tpope/vim-fugitive'          " Git wrapper
Plug 'airblade/vim-gitgutter'     " Shows git diff in the gutter
Plug 'jiangmiao/auto-pairs'       " Automatically close brackets, quotes, etc.

Plug 'neovim/nvim-lspconfig'

call plug#end()

lua require("toggleterm").setup{}


lua require'lsp_setup'

" Enable line numbers
set number

" Setup for nvim-compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:true

" Key mappings for nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
nnoremap <C-p> :FZF<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Theme
colorscheme gruvbox

" Status line
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "lua", "bash", "javascript", "json", "html", "css", "rust"},
  highlight = {
    enable = true, -- Use TreeSitter's syntax highlighting
  },
  autotag = {
    enable = true,
  },
}
EOF

" Terminal toggle keybinding
nnoremap <Leader>t :ToggleTerm<CR>