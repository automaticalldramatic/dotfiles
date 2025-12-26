return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.gopls = {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/gopls" },
        mason = false,
        autostart = true,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
        single_file_support = true,
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      }

      opts.setup = opts.setup or {}
      opts.setup.gopls = function(_, server_opts)
        vim.lsp.config("gopls", server_opts)
        vim.lsp.enable("gopls")
        if vim.v.vim_did_enter == 1 then
          vim.cmd.doautoall("nvim.lsp.enable FileType")
        else
          vim.api.nvim_create_autocmd("VimEnter", {
            once = true,
            callback = function()
              vim.cmd.doautoall("nvim.lsp.enable FileType")
            end,
          })
        end
        return true
      end
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "gopls" })
    end,
  },
}
