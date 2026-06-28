return {
  'seblyng/roslyn.nvim',
  ft = 'cs',

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    {
      'williamboman/mason.nvim',
      opts = {

        registries = {
          'github:mason-org/mason-registry',

          'github:Crashdummyy/mason-registry', -- needed for roslyn
        },
      },
    },
  },

  config = function()
    require('roslyn').setup {

      args = {
        '--logLevel=Information',
        '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
        '--stdio',
      },

      config = {
        filewatching = false,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        -- on_attach = function(client, bufnr)
        --   client.server_capabilities.inlayHintProvider = false
        --   client.server_capabilities.diagnosticProvider = nil
        -- end,

        settings = {
          ['csharp|background_analysis'] = {
            dotnet_analyzer_diagnostics_scope = 'openFiles',
            dotnet_compiler_diagnostics_scope = 'openFiles',
          },
          ['csharp|completion'] = {
            dotnet_provide_regex_completions = 'true',
            dotnet_show_completion_items_from_unimported_namespaces = 'true',
            dotnet_show_name_completion_suggestions = 'true',
          },
          ['csharp|inlay_hints'] = {
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
          },
          ['csharp|code_lens'] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      },
    }
  end,
}
