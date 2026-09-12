-- =============================================================
-- MAPLEADER & MAPLOCALLEADER
-- =============================================================
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- =============================================================
-- FILE EXPLORER (netrw)
-- =============================================================
vim.g.netrw_banner = 0 -- hide the verbose help banner in netrw

-- =============================================================
-- LINE NUMBERS & INDENTATION
-- =============================================================
vim.opt.number = true -- show absolute line number on current line
vim.opt.relativenumber = true -- show relative line numbers on other lines
vim.opt.tabstop = 4 -- width of a tab character
vim.opt.softtabstop = 4 -- columns inserted/removed when pressing Tab/Backspace
vim.opt.shiftwidth = 4 -- width used by << / >> and auto-indent
vim.opt.expandtab = true -- insert spaces instead of a real tab character
vim.opt.wrap = false -- don't soft-wrap long lines
vim.opt.smartindent = true -- basic automatic indenting on new lines
vim.opt.breakindent = true -- preserve indentation on wrapped lines (if wrap were on)

-- =============================================================
-- SEARCH & COMMAND PREVIEW
-- =============================================================
vim.opt.inccommand = "split" -- live preview of :s substitutions in a split
vim.opt.ignorecase = true -- case-insensitive search by default
vim.opt.smartcase = true -- ...unless the search pattern has an uppercase letter
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --smart-case" -- use ripgrep for :grep if available
    vim.opt.grepformat = "%f:%l:%c:%m"
end

-- =============================================================
-- WINDOW / SPLIT BEHAVIOR
-- =============================================================
vim.opt.splitbelow = true -- :split opens below the current window
vim.opt.splitright = true -- :vsplit opens to the right of the current window
vim.opt.laststatus = 3 -- one global statusline instead of one per window

-- =============================================================
-- PERSISTENCE (swap / backup / undo)
-- =============================================================
vim.opt.swapfile = true -- keep swapfiles for crash recovery
vim.opt.directory = vim.fn.stdpath("data") .. "/swap//" -- centralize swapfiles, "//" avoids name collisions
vim.opt.backup = false -- don't keep backup~ files before overwriting
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- persistent undo history location
vim.opt.undofile = true -- enable undo history across sessions

-- =============================================================
-- CLIPBOARD
-- =============================================================
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end) -- share system clipboard, deferred so it doesn't block startup

-- =============================================================
-- FILENAME / PATH HANDLING
-- =============================================================
vim.opt.isfname:append("@-@") -- allow "@" in filenames recognized by gf, e.g. scoped packages
-- vim.opt.whichwrap:append("<,>,[,],h,l") -- let h/l and arrow keys wrap to prev/next line at line boundaries
-- vim.opt.iskeyword:append("-")           -- treat "-" as part of a word for dw/ciw, useful for kebab-case

-- =============================================================
-- CURSOR & UI CHROME
-- =============================================================
-- vim.opt.guicursor = ""                  -- force block cursor in every mode instead of terminal default
vim.opt.scrolloff = 10 -- keep 10 lines visible above/below the cursor when scrolling
vim.opt.termguicolors = true -- enable true 24-bit color, needed for modern colorschemes
-- vim.opt.colorcolumn = "80"              -- vertical guide line at column 80
vim.opt.signcolumn = "yes" -- always reserve the sign column (LSP/git signs) to avoid text shifting
vim.opt.cmdheight = 0 -- hide the command-line row when not in use
vim.opt.cursorline = true -- highlight the line the cursor is on
vim.opt.pumblend = 10 -- transparency for the popup completion menu
vim.opt.winblend = 10 -- transparency for floating windows

-- =============================================================
-- WHITESPACE VISUALIZATION
-- =============================================================
vim.opt.list = true -- show invisible characters (tabs, trailing spaces)
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- symbols used to render them

-- =============================================================
-- RESPONSIVENESS / TIMING
-- =============================================================
vim.opt.updatetime = 250 -- faster trigger for CursorHold, LSP hover, gitsigns, etc.
vim.opt.timeoutlen = 300 -- shorter wait for a mapped key sequence to complete (e.g. <leader>)

-- =============================================================
-- INPUT / EDITING BEHAVIOR
-- =============================================================
vim.opt.mouse = "a" -- enable mouse support in all modes
vim.opt.confirm = true -- ask to save instead of erroring on :q with unsaved changes
vim.opt.virtualedit = "block" -- allow Visual Block mode to move into empty space

-- =============================================================
-- COMPLETION
-- =============================================================
vim.opt.completeopt = "menuone,noselect,popup" -- required behavior for native/blink.cmp completion menus
vim.opt.pumheight = 10 -- cap the completion popup at 10 visible entries

-- =============================================================
-- MESSAGES
-- =============================================================
vim.opt.shortmess:append("sWcI") -- silence "search hit BOTTOM", write msgs, completion msgs, intro msg
-- vim.opt.shortmess:append("c") -- (subset of above) suppress completion-related messages only

-- =============================================================
-- DISABLE UNUSED PROVIDERS
-- =============================================================
vim.g.loaded_python3_provider = 0 -- skip Python remote plugin provider (not needed, see earlier discussion)
vim.g.loaded_ruby_provider = 0 -- skip Ruby remote plugin provider
vim.g.loaded_node_provider = 0 -- skip Node.js remote plugin provider
vim.g.loaded_perl_provider = 0 -- skip Perl remote plugin provider

-- =============================================================
-- FOLDING (requires Treesitter, currently unused)
-- =============================================================
vim.opt.foldmethod = "indent" -- fold by indent
vim.opt.foldlevel = 99 -- start with all folds open

vim.filetype.add({
    filename = {
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
    },
})
