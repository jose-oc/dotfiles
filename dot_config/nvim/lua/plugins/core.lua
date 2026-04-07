return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "markdown",
          "markdown_inline",
          "yaml",
          "json",
          "python",
          "go",
          "terraform",
          "hcl",
          "dockerfile",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("gopls")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("bashls")

      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format" },
          go = { "gofmt" },
          terraform = { "terraform_fmt" },
          hcl = { "terraform_fmt" },
          yaml = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" },
        },
      })

      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end)
    end,
  },

  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({})
      vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
      vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")
      vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
      vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>")
    end,
  },
}
