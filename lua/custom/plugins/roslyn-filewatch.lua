return {
  'khoido2003/roslyn-filewatch.nvim',
  build = 'nvim -l build.lua --',
  config = function()
    require('roslyn_filewatch').setup {
      client_names = { 'roslyn' },
      preset = 'auto',
      deferred_loading = true,
      deferred_loading_delay_ms = 500,
      ignore_dirs = {
        'Library',
        'Temp',
        'obj',
      },
      watch_extensions = {
        '.cs',
        '.csproj',
        '.slnx',
      },
      diagnostic_throttling = {
        enabled = true,
        visible_only = true,
      },
    }
  end,
}
