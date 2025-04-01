-- Custom function for organizing imports
local function organize_imports()
	local params = {
		command = 'pyright.organizeimports',
		arguments = { vim.uri_from_bufnr(0) },
	}
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf(), name = 'pyright' })
	for _, client in ipairs(clients) do
		client.request('workspace/executeCommand', params, nil, 0)
	end
end

-- Custom function to set Python path
local function set_python_path(path)
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf(), name = 'pyright' })
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
		else
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
		end
		client.notify('workspace/didChangeConfiguration', { settings = nil })
	end
end

-- Register custom commands
vim.api.nvim_create_user_command('PyrightOrganizeImports', organize_imports, { desc = 'Organize Imports' })
vim.api.nvim_create_user_command('PyrightSetPythonPath', function(opts)
	set_python_path(opts.args)
end, {
desc = 'Reconfigure pyright with the provided python path',
nargs = 1,
complete = 'file',
})

return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
  single_file_support = true, -- Optional, still supported
}
