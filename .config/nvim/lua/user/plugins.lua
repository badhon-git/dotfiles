-- Rubya Akter Badhon

return {
 
  { "bluz71/vim-nightfly-colors", name = "nightfly", priority = 1000, config = function()
    vim.cmd("colorscheme nightfly")
   end },

  { "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
    },
  },

  { "nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "lua", "vim", "vimdoc" },
      highlight = { enable = true },
      indent = { enable = true },
    })
   end },

  { "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<leader>t", "<cmd>NvimTreeToggle<CR>" } },
    config = function() require("nvim-tree").setup() end },

  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "pyright" } })
    end },

 { "neovim/nvim-lspconfig",
  dependencies = { "mason-lspconfig.nvim" },
  config = function()
    vim.lsp.config("pyright", {})
    vim.lsp.enable("pyright")
   end },

  { "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
      })
    end },

  { "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_flavor = "latex"
  end},

}
