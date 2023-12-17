local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

local ft = require("Comment.ft")

ft.asm = "#%s"

comment.setup()
