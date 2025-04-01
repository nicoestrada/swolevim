return {
	cmd = { 'ocaml-language-server', '--stdio' },
	filetypes = { 'ocaml', 'reason' },
	root_markers = {
		'*.opam',
		'esy.json',
		'package.json',
	},
}
