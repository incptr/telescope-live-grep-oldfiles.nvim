local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")

return function(opts)
	opts = opts or {}
	opts.include_current_session = vim.F.if_nil(opts.include_current_session, true)

	local current_buffer = vim.api.nvim_get_current_buf()
	local current_file = vim.api.nvim_buf_get_name(current_buffer)
	local results = {}

	if opts.include_current_session then
		for _, buffer in ipairs(vim.split(vim.fn.execute(":buffers! t"), "\n")) do
			local match = tonumber(string.match(buffer, "%s*(%d+)"))
			local open_by_lsp = string.match(buffer, "line 0$")
			if match and not open_by_lsp then
				local file = vim.api.nvim_buf_get_name(match)
				if vim.loop.fs_stat(file) and match ~= current_buffer then
					table.insert(results, file)
				end
			end
		end
	end

	for _, file in ipairs(vim.v.oldfiles) do
		local file_stat = vim.loop.fs_stat(file)
		if file_stat and file_stat.type == "file" and not vim.tbl_contains(results, file) and file ~= current_file then
			table.insert(results, file)
		end
	end

	if opts.cwd_only then
		local cwd = vim.loop.cwd() .. utils.get_separator()
		cwd = cwd:gsub([[\]], [[\\]])
		results = vim.tbl_filter(function(file)
			return vim.fn.matchstrpos(file, cwd)[2] ~= -1
		end, results)
	end

	require("telescope.builtin").live_grep({
		prompt_title = "Oldfiles live grep (args)",
		search_dirs = results,
	})
end
