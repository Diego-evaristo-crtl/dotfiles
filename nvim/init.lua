-- loads vimrc.vim, the same as executing init.vim (vimrc) and init.lua
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- sets vim.g.mapleader (<leader> key) for keybinding use
vim.g.mapleader = " "

-- configures nvim-treesitter for beter syntax highlighting, see their github page
local parsers_dir = "/home/diego/.config/nvim/trsit-parsers"

require 'nvim-treesitter.configs'.setup {
    parser_install_dir = parsers_dir,
    ensure_instaled = {"all"},
    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

vim.opt.runtimepath:append(parsers_dir)

-- enabling treesiter modules
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true
    },
    text_objects = {
        enable = true
    },
}

-- sets keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {desc='Telescope find files'})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {desc='Telescope live grep'})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {desc='Telescope buffers'})
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {desc='Telescope help tags'})
vim.keymap.set('n', '<leader>c', vim.cmd.Ex)
