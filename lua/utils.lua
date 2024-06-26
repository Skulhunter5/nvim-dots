local M = {}

M.is_nixos = function ()
    local nixos = false
    local f = io.open("/etc/os-release", "r")
    if f then
        for line in f:lines() do
            if line:match("^ID=") then
                if line:match("nixos") then
                    nixos = true
                else
                    nixos = false
                end
                break
            end
        end
        f:close()
    end
    return nixos
end

return M
