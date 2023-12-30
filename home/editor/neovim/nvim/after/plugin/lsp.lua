local lsp = require('lsp-zero').preset({})

lsp.setup_servers({'clangd', 'ocamllsp', 'pylsp', 'ruff_lsp', 'rust_analyzer'})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.on_attach(
  function(client, bufnr)
    local nmap = function(keys, func, desc)
      if desc then
	desc = 'LSP: ' .. desc
      end

      vim.keymap.set(
        'n', keys, func, { buffer = bufnr, desc = desc, remap = false }
      )
    end

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
    nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
    nmap('<leader>vd', vim.diagnostic.open_float, 'Open floating diagnostic message')
  end
)

lsp.setup()

local cmp = require('cmp')
local luasnip = require('luasnip')

luasnip.config.setup()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({select=true}),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
  },
})
