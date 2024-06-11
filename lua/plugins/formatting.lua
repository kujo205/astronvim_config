return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },

  config = function()
    local conform = require "conform"
    conform.setup {

      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        lua = { "stylelua" },
        python = { "isort", "black" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    vim.keymap.set(
      { "n", "v" },
      "<leader>mp",
      function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      { desc = "Format file in range (in visual mode)" }
    )
  end,
}
