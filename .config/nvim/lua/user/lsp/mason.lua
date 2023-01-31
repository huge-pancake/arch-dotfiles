local servers = {
  'sumneko_lua',
  'bashls',
  'jsonls',
  'yamlls',
  'cssls',
  'html',
  'tsserver',
  'rust_analyzer',
  'volar',
  'clangd'
}

local settings = {
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '◍',
      package_pending = '◍',
      package_uninstalled = '◍',
    },
  },
  keymaps = {
    toggle_server_expand = '<CR>',
    install_server = 'i',
    update_server = 'u',
    check_server_version = 'c',
    update_all_servers = 'U',
    check_outdated_servers = 'C',
    uninstall_server = 'X',
    cancel_installation = '<C-c>',
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 10,
}

require('mason').setup(settings)
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('user.lsp.handlers').on_attach,
  	capabilities = require('user.lsp.handlers').capabilities,
  }

  server = vim.split(server, '@')[1]

  local require_ok, conf_opts = pcall(require, 'user.lsp.settings.' .. server)
  if require_ok then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
