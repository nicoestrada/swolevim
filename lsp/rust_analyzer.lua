return {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
	single_file_support = true,
	settings = {
		['rust-analyzer'] = {}, -- Add custom settings here if needed
	},
}
