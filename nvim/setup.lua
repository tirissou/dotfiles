local cmp = require'cmp'

cmp.setup({
    snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	end,
    },
    window = {
	-- completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-c>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	-- { name = 'vsnip' }, -- For vsnip users.
	{ name = 'luasnip' }, -- For luasnip users.
	-- { name = 'ultisnips' }, -- For ultisnips users.
	-- { name = 'snippy' }, -- For snippy users.

    }, {
	{ name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
	{ name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    -- }, {
	{ name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{ name = 'path' },
	{ name = 'buffer' }
    })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{ name = 'path' }
    }, {
	{ name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local nvim_lsp = require('lspconfig')
require('nvim-autopairs').setup{}
require('cmp_git').setup()
require("symbols-outline").setup({
    fold_markers = { '+', '-' },
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = true,
    show_numbers = false,
    show_relative_numbers = true,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    autofold_depth = 1,
    auto_unfold_hover = true,
    symbols = {
	Package = {icon = "📦", hl = "TSNamespace"},
	Variable = {icon = "𝔁", hl = "TSConstant"},
	Constant = {icon = "𝒸", hl = "TSConstant"},
    }

})
require('lsp_signature').setup({
    bind = true,
    always_trigger = true,
    handler_opts = {
	border = "rounded"
    }
})

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'tailwindcss', 'dockerls', 'terraformls', 'svelte'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = {
	    debounce_text_changes = 150,
	}
    }
end

-- Reference: https://github.com/lithammer/nvim-diagnosticls
-- nvim_lsp.diagnosticls.setup({
--   filetypes = {
--       -- "python",
--       "terraform",
--   },
--   init_options = {
--     linters = {
--       terraform_validate = {
-- 	  command = "terraform validate --json"
--       }
--     },
--     filetypes = {
--       terraform = "terraform_validate"
--     },
--   },
-- })
