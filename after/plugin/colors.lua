function ColorPump(color)
	color = color or "cyberdream"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none", ctermbg = "NONE" })
end

ColorPump()
