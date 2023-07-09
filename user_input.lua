-- штука для удобной работы с людскими инпутами
-- Для ее работы из модульки при нажатии кнопки игроком мы каждый кадр вызываем
-- playerPressKey(player, key), где player это нажавший игрок, а key - строка
-- с названием кнопки. Под каким названием мы сообщим об этой кнопке из модульки, под таким и сможем обратиться из lua
-- например
-- lua_push_int(":player_id"),
-- lua_push_str("@v"),
-- lua_call("@playerPressKey", 2),
--
-- узнать, что игрок нажал эту кнопку мы сможем вызовом playerKeyPressed(player, "v")
-- информация должна очищаться каждый кадр, поэтому импортироваться данный файл должен В КОНЦЕ

local inputs = {}

function playerPressKey(player, key)
	local curInputs = inputs[player]
	if curInputs == nil then
		curInputs = {}
		inputs[player] = curInputs
	end
	
	curInputs[key] = true
	
end

function playerKeyPressed(player, key)
	local curInputs = inputs[player]
	if curInputs == nil then
		return false
	end
	
	return (curInputs[key] == true)
	
end

addTriggerBS(1,0,0,function()
	inputs = {}
end)
--[[
addTrigger("mst_some_template", 0, 0, 0, function()
	inputs = {}
end)
--]]