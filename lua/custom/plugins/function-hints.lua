return {
  'ray-x/lsp_signature.nvim',
  event = 'LspAttach',
  opts = {
    hint_enable = true,
    floating_window = true,
    handler_opts = {
      border = 'rounded',
    },
  },
}
