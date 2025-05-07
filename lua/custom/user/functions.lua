-- Set theme based on env variable
-- to light/dark versions

local M = {}

M.set_theme = function()
    local cs
    local fpath = os.getenv("HOME") .. "/.background"
    local f = io.open(fpath)

    if not f then
        cs = "dayfox"
        return
    end

    for line in f:lines() do
        if line == "dark" then
            cs = "nightfox"
        else
            cs = "dayfox"
        end
    end

    vim.cmd("colorscheme " .. cs)
end

return M
