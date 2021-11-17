-------------------------------------------------------------------------------
-- General Settings
-------------------------------------------------------------------------------
vim.o.mouse          = 'a'                -- Enable mouse support
vim.o.termguicolors  = true               -- Enable 24 bit colors
vim.o.modeline       = false              -- Disable modeline
vim.o.secure         = true               -- No commands in .nvimrc, .exrc
vim.o.hidden         = true               -- Allow hidden buffers
vim.o.spell          = true               -- Enable spell checking
vim.o.spelllang      = 'en'               -- Spell checking language
vim.o.backup         = false              -- Do not keep backup file after write
vim.o.writebackup    = true               -- Create backup and keep until file is written
vim.o.swapfile       = false              -- Disable swap files
vim.o.undofile       = false              -- Disable persistent undo
vim.o.startofline    = false              -- Try to preserve cursor column
vim.o.fileformat     = 'unix'             -- Use unix EOL
vim.o.encoding       = 'utf-8'            -- Use UTF-8
vim.o.fileencoding   = 'utf-8'            -- Use UTF-8
vim.o.nrformats      = 'bin,hex,alpha'    -- Number formats for increment/decrement
vim.o.backspace      = 'indent,eol,start' -- Backspace deletes across lines and indents
vim.o.history        = 100                -- History size
vim.o.matchpairs     = '(:),{:},[:],<:>'  -- Characters that form pairs
vim.o.completeopt    = 'menuone,noselect,noinsert'
vim.o.sessionoptions = 'globals,curdir,buffers,winsize,tabpages,folds,slash,unix'
vim.o.diffopt        = 'internal,filler,algorithm:histogram,indent-heuristic'

-------------------------------------------------------------------------------
--Spaces & Tabs
-------------------------------------------------------------------------------
vim.o.tabstop     = 4     -- Number of visual spaces per tab
vim.o.softtabstop = 4     -- Number of spaces in tab
vim.o.shiftwidth  = 4     -- Indent width
vim.o.shiftround  = true  -- Round indents to specified indent width
vim.o.expandtab   = true  -- Use spaces for tabs
vim.o.joinspaces  = false -- Use one space (not two) after punctuation and when joining

-------------------------------------------------------------------------------
-- Searching & Replacing
-------------------------------------------------------------------------------
vim.o.incsearch  = true      -- Enable incremental search
vim.o.hlsearch   = true      -- Highlight search matches
vim.o.ignorecase = true      -- Case-insensitive search by default
vim.o.smartcase  = true      -- Switch to case-sensitive search if there's capital letter
vim.o.inccommand = 'nosplit' -- Live substitute preview

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------
vim.o.number     = true    -- Show line numbers
vim.o.showcmd    = true    -- Show command at the bottom
vim.o.cursorline = false   -- Don't highlight cursor line
vim.o.wildmenu   = true    -- Enable visual completion menu
vim.o.pumblend   = 15      -- Pop-up menu transparency
vim.o.lazyredraw = true    -- Enable lazy redraw
vim.o.showmatch  = false   -- Disable jump to matching bracket
vim.o.laststatus = 2       -- Always show status line
vim.o.ruler      = true    -- Show cursor position
vim.o.wrap       = false   -- Don't wrap lines by default
vim.o.showmode   = false   -- Don't show mode
vim.o.splitright = true    -- Vertical split to the right
vim.o.linebreak  = true    -- Wrap on word boundary
vim.o.showbreak  = '↪ '    -- Wrapped line indicator
vim.o.listchars = 'eol:↲,nbsp:␣,tab:▸→,extends:❯,precedes:❮,trail:∙' -- Characters to display for invisible characters
vim.o.fillchars  = 'eob: ' -- Customise fill characters

