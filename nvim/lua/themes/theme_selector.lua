local function get_theme_module()
    local handle = io.popen("omarchy-theme-current")
    if not handle then return "themes.tokyo_night" end

    local theme_name = handle:read("*a")
    handle:close()

    if not theme_name or theme_name == "" then
        theme_name = "Tokyo Night"
    end

    theme_name = theme_name
        :gsub("^%s+", "")
        :gsub("%s+$", "")
        :gsub("%s+", "_")
        :gsub("-", "_")
        :lower()

    return "themes." .. theme_name
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end,
})

local theme_module = get_theme_module()
local ok, theme_spec = pcall(require, theme_module)

if not ok then
    theme_spec = require("themes.tokyo_night")
end

return theme_spec

