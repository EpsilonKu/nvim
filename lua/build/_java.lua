
local M = {}

function M.build()
	local term = require("FTerm.terminal")
	local springTerm = term:new():setup({
		cmd = "./mvnw spring-boot:run",
		dimensions = {
			height = 0.8,
			width = 0.8
		}
	})
	springTerm:toggle()
end

return M

