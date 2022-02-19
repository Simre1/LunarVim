-- general
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- set keymap with custom {noremap = true}s

-- lvim.builtin.which_key.mappings["<leader>a"] = { "<C-w>", "Windows"}

-- lvim.keys.normal_mode["<leader>a"] = {"<C-w>", { noremap = false }}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- lvim.builtin.which_key.mappings["g"] = { "<cmd>Telescope projects<CR>", "Projects" }


lvim.builtin.which_key.mappings["lB"] = { ":lua require('custom.setup_lsp').setup()<CR>", "Boot server" }

-- Configure builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.treesitter.ensure_installed = {"haskell","c", "python", "java", "javascript", "rust", "markdown", "norg"}
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.project.manual_mode = true

lvim.lsp.diagnostics.virtual_text = true

-- Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.override, {"hls", "rust_analyzer" })

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black" },
  {
    command = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "black" },
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}


-- Additional Plugins
lvim.plugins = {
    {"lunarvim/colorschemes"},
    {"folke/tokyonight.nvim"},
    {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "BufRead"
    },
    {
      "simrat39/rust-tools.nvim",
      ft = { "rust", "rs" },
    },
    {
    "nvim-neorg/neorg",
    -- tag = "latest",
    ft = "norg",
    after = "nvim-treesitter", -- You may want to specify Telescope here as well
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/Documents/notes/study",
                home = "~/Documents/notes/home",
              }
            }
          }
        }
    }
    end
    }
}

