-- ===== HOOK (CHẠY TRƯỚC) =====
local dumped = false
local old_concat = table.concat

table.concat = function(t, ...)
    local res = old_concat(t, ...)
    if not dumped
        and type(res) == "string"
        and #res > 3000
        and res:find("function") then

        dumped = true
        local ok, err = pcall(function()
            writefile("locker.lua", res)
        end)

        if ok then
            warn("[OK] Saved locker.lua")
        else
            warn("[ERROR] writefile failed:", err)
        end
    end
    return res
end

-- ===== LOAD FILE CẦN GIẢI (CHỈ 1 LẦN) =====
loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/xuanthientrinh4-create/Locker/main/leak%20locker.lua"
))()
