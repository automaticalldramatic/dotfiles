return {
  -- Install vtsls via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "vtsls",
      },
    },
  },

  -- Configure TypeScript/JavaScript LSP with vtsls
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          enabled = true,
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        },
        -- Disable other TypeScript servers to avoid conflicts
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
      },
    },
  },

  -- Add TypeScript-specific keymaps
  {
    "neovim/nvim-lspconfig",
    config = function()
      local util = require("lspconfig.util")

      -- Set up keymaps when vtsls attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "vtsls" then
            local buf = args.buf
            vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buf, desc = "Organize Imports" })
            vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { buffer = buf, desc = "Rename File" })
          end
        end,
      })
    end,
  },
}