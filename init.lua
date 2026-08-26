
-----------------------[ Globals ]-----------------------

-- set leader key to <Space>
-- in some cases it is better to have it at the start of the config
vim.g.mapleader =  " "

-----------------------[ Plugins ]-----------------------

-- Check Neovim version >= 0.12
if vim.fn.has('nvim-0.12') == 1 then

    -- download plugins with built-in vim.pack
    -- you don't really need plugins, mini.clue helps you remember keymaps
    -- comment/delete the entire section if you don't want it
    vim.pack.add({
        { src = "https://github.com/nvim-mini/mini.clue.git" }
    })

    -- loading and configuring mini.clue
    local miniclue = require 'mini.clue'
    miniclue.setup {
        triggers = {
            { mode = { 'n', 'x' }, keys = 'g' },
            { mode = { 'n', 'x' }, keys = '`' },
            { mode = { 'n', 'x' }, keys = '"' },
            { mode = { 'n', 'x' }, keys = 'z' },
            { mode = { 'i', 'c' }, keys = '<C-r>' },
            { mode = 'n', keys = '<C-w>' },
            { mode = 'i', keys = '<C-x>' },
            { mode = { 'n', 'x' }, keys = '<leader>' },
            { mode = 'n', keys = '[' },
            { mode = 'n', keys = ']' },
        },
        clues = {
            miniclue.gen_clues.g(),
            miniclue.gen_clues.z(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
        },
        window = {
            delay = 500,
            scroll_down = '<C-f>',
            scroll_up = '<C-b>',
        },
    }

end


-----------------------[ Options ]-----------------------

-- show line numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- set default indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- set indentation behaviour
vim.o.smartindent = true
vim.o.shiftround = true

-- use spaces when inserting tabs
vim.opt.expandtab = true

-- show whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '·' }

-- incremental command preview when search/replace
vim.opt.inccommand = 'split'

-- ask confirm when leaving unsaved files
vim.opt.confirm = true

-- open windows right/low as default
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- visual settings
vim.opt.termguicolors = true

-- keep signcolumn on by default (:h signcolumn)
vim.opt.signcolumn = "yes"

-- update times and timeouts (for performance)
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10

-----------------------[ Autocommands ]-----------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup("User/HighlightText", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-----------------------[ Keymaps ]-----------------------

-- powerful Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "<Esc> to clear search highlights" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { desc = "<Esc> to exit terminal mode" })

-- indent while remaining in visual mode, keeps original mapping < or >
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true, desc = 'Move block selection left' })
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true, desc = 'Move block selection right' })

-- life-saving copy/paste to system clipboard (and delete)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blackhole" })
vim.keymap.set("v", "<leader>p", [["_dP]], { desc = "Delete to blackhole and Paste" })

-- quick global selected file replace (: %s/old/new command)
vim.keymap.set("v", "<leader>r", [["hy:%s/<C-r>h//g<left><left>]], { desc = "Replace selection globally" })
