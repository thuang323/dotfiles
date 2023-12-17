local setup, fidget = pcall(require, "fidget")
if not setup then
	print("fidget issue")
	return
end

fidget.setup({})
