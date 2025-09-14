return {
  -- LSP configuration for multiple languages
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'

      -- Example: Setup for Go
      lspconfig.gopls.setup {
        settings = {
          gopls = {
            staticcheck = true, -- Enable static analysis
          },
        },
      }
      lspconfig.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              command = 'clippy', -- Use Clippy for linting
            },
          },
        },
      }

      -- Example: Setup for Python
      lspconfig.pyright.setup {}

      -- Keybinding for hover documentation
      vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
    end,
  },

  -- Plugin for function signature help
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup {
        bind = true,
        hint_enable = true,
        floating_window = true, -- Show floating window with parameter hints
      }
    end,
  },
  --
  -- -- UI Enhancements for LSP
  -- {
  --   'glepnir/lspsaga.nvim',
  --   branch = 'main',
  --   config = function()
  --     require('lspsaga').setup {
  --       ui = {
  --         border = 'rounded',
  --       },
  --     }
  --   end,
  -- },

  -- Autocompletion setup
  --   {
  --     'hrsh7th/nvim-cmp',
  --     dependencies = {
  --       'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  --       'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
  --       'hrsh7th/cmp-path', -- Path source for nvim-cmp
  --       'hrsh7th/cmp-cmdline', -- Command-line source for nvim-cmp
  --       'L3MON4D3/LuaSnip', -- Snippet engine
  --       'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
  --     },
  --     config = function()
  --       local cmp = require 'cmp'
  --       cmp.setup {
  --         snippet = {
  --           expand = function(args)
  --             require('luasnip').lsp_expand(args.body)
  --           end,
  --         },
  --         mapping = cmp.mapping.preset.insert {
  --           ['<C-Space>'] = cmp.mapping.complete(),
  --           ['<CR>'] = cmp.mapping.confirm { select = true },
  --         },
  --         sources = cmp.config.sources {
  --           { name = 'nvim_lsp' },
  --           { name = 'buffer' },
  --           { name = 'path' },
  --         },
  --       }
  --     end,
  --   },
}
