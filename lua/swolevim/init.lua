require("swolevim.remap")
require("swolevim.set")

vim.lsp.enable({'luals', 'pyright', 'ocamlls', 'rust_analyzer'})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- make autocomplete actually useful
vim.cmd("set completeopt+=noselect")

vim.o.winborder = 'rounded'
