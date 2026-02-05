local URL = "https://raw.githubusercontent.com/xuanthientrinh4-create/Locker/refs/heads/main/leak%20locker.lua"

-- hook
local old_loadstring = loadstring
loadstring = function(src, ...)
    if type(src) == "string" and #src > 1000 then
        -- lưu code đã được client load/giải
        writefile("locker.lua", src)
        warn("[OK] Saved to locker.lua")
    end
    return old_loadstring(src, ...)
end

-- lấy code 
local code = game:HttpGet(URL)
loadstring(code)()
