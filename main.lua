--ываыаывп
game.display_message("Running main.lua")

dofile("game_trigger_manager.lua")
dofile("orra_basic_functions.lua")
dofile("parenting_system/parenting_driver.lua")
dofile("user_input.lua")
dofile("vehicle_scripts/orra_vehicle_default_settings.lua")
dofile("vehicle_scripts/orra_save_vehicle.lua")
dofile("vehicle_scripts/orra_vehicle_triggers.lua")
dofile("vehicle_scripts/vehicle_system.lua")
dofile("vehicle_scripts/vehicle_types.lua")
dofile("vehicle_scripts/vehicle_import.lua")

for i, value in ipairs(gamemodes) do
    addTrigger(value, 0, 0, 0, function() return game.key_clicked(game.const.key_k) end, 
    function() 

    if not (inReinit == nil) then
        inReinit = nil
        return
    end
    inReinit = true
    deinitTriggers()
    dofile("main.lua")

    game.display_message("Lua downloaded!") 
    end)
end


ipBanFile = "ip_bans.txt"
ipBans = {}

function isIpBanned(ip)
    for index, value in ipairs(ipBans) do
        if value == ip then
            return true
        end
    end
    
    return false
end

function cfIsIpBanned(ip)
    if not isIpBanned(ip) then
        game.fail()
    end
end

function banIp(ip, guid, name)
    if not isIpBanned(ip) then
        table.insert(ipBans, ip)
        local file = io.open(ipBanFile, "a+b")
        file:write(string.format("%s # %s (%s)\n", ip, name, guid))
        file:close()
    end
end

function loadBanList()
    local file = io.open(ipBanFile, "r")
    
    if file ~= nil then
        for line in file:lines() do
            local match = string.match(line, "^(%d+%.%d+%.%d+%.%d+)")
            if match ~= nil then
                table.insert(ipBans, match)
            end
        end
        
        file:close()
    end
end

loadBanList()
--]]
