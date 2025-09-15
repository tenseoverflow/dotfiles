return {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = { ".git", "pom.xml", "build.gradle", "settings.gradle" },
	settings = {
		java = {
			format = {
				enabled = false,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			completion = { guessMethodArguments = true },
		},
	},
}