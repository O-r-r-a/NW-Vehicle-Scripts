local function createScenePropElement()
    return {number = 0, kind = 0, var1 = 0, var2 = 0, scaleX = 0, scaleY =0, scaleZ = 0}
end

local function loadFromDict(dictId)
    local array = {}
    local maxSlot = game.dict_get_int(0,dictId,"MaxEntitySlot")
    for childSlot = 0, maxSlot do
        local newElement = createScenePropElement()
        newElement.number = childSlot -- порядковый номер, чтоб по нему могли потом достать позицию
        newElement.kind = game.dict_get_int(0,dictId,"Kind "..childSlot)
        newElement.var1 = game.dict_get_int(0,dictId,"Var1 "..childSlot)
		newElement.var2 = game.dict_get_int(0,dictId,"Var2 "..childSlot)
		newElement.scaleX = game.dict_get_int(0,dictId,"ScaleX "..childSlot)
		newElement.scaleY = game.dict_get_int(0,dictId,"ScaleY "..childSlot)
		newElement.scaleZ = game.dict_get_int(0,dictId,"ScaleZ "..childSlot)
		
		if ((newElement.var1 == 100) and (newElement.var2 == 34)) or
			(newElement.var1 == 83)
		then
		else
			array[#array + 1] = newElement
		end
		
		
		
    end

    return array
end






local function spawnItems(itemsForSpawn, dict)

	for i = 1, #itemsForSpawn do
	    local item = itemsForSpawn[i]
		           
				   
		--game.init_position(0)
		
		--game.set_fixed_point_multiplier(100000)
	
		--назначаем позицию и вращение 
		--game.preg[0] = game.pos.new({o = {x = item.x - 135, y = item.y - 120, z = item.z},
		
		--game.preg[0] = game.pos.new({o = {x = item.x-125, y = item.y-125, z = item.z},
		
		-- вращение
		--rot = {s = {x = item.sx, y = item.sy, z = item.sx},
		--	   f = {x = item.fx, y = item.fy, z = item.fx},
		--	   u = {x = item.ux, y = item.uy, z = item.ux},
		--					    }})
								
		--game.display_message("x: " .. tostring(game.position_get_x(0, 0)))
		--game.display_message("y: " .. tostring(game.position_get_y(0, 0)))

											  

		--game.display_message("x: " .. tostring(game.preg[0].rot.f.x))
		--game.display_message("y: " .. tostring(game.preg[0].rot.f.y))
		--game.display_message("z: " .. tostring(game.preg[0].rot.f.z))
		
		
		--game.display_message( "dict has key \"" .. key  .. "\": " .. tostring(game.dict_has_key(dict, key)))
		dict_get_pos(5,dict,"Pos "..item.number)
		--game.position_set_scale_x(5, item.scaleX)
		--game.position_set_scale_y(5, item.scaleY)
		--game.position_set_scale_z(5, item.scaleZ)
		game.set_spawn_position(5)
		

		--game.display_message("Spawn item " .. tostring(item.kind) .. ", var1: " .. tostring(item.var1) .. ", var2: " .. item.var2)
		game.spawn_scene_prop(item.kind) 
		item.spawnedProp = game.reg[0] -- добавляем для айтема еще одно поле которое хранит id заспавненого пропа
		game.set_fixed_point_multiplier(100000)
		game.prop_instance_set_scale(item.spawnedProp,item.scaleX,item.scaleY,item.scaleZ)
		--game.display_message("x: " .. tostring(item.scaleX) .. ", y: " .. tostring(item.scaleY) .. ", z: " .. tostring(item.scaleZ))
		--game.prop_instance_set_scale(item.spawnedProp, math.floor(item.scaleX/10), math.floor(item.scaleY/10), math.floor(item.scaleZ/10))
		--game.prop_instance_set_scale(item.spawnedProp, 1000, 1000, 1000)
		--game.display_message("Item spawned: " .. tostring(item.spawnedProp))
		--game.display_message("prop kind: " .. tostring(game.prop_instance_get_scene_prop_kind(0, item.spawnedProp)))

		
	end
	
	return itemsForSpawn

end



local function getRoot(itemsForSpawn)

	for i = 1, #itemsForSpawn do
		if itemsForSpawn[i].var1 == 100 then return itemsForSpawn[i] end -- если вар2 равен нулю то считаем данный обьект рутом
	end
	
end


local function getLogicObject(newVehicle, var1, propId)
	local object = nil
	if newVehicle.typeId == VEHICLE_TYPE_JEEP then
		-- Control Button
		if var1 == 96 then
			object = dofile("./vehicles/steering_wheel.lua")
		elseif var1 == 95 then
			print"FOUND BUTTON"
			object = dofile("./vehicles/control_button.lua")
		elseif (var1 == 94) then-- Front wheels
			object = dofile("./vehicles/wheels.lua")
			object.wheelPosition = 1
			newVehicle.frontWheels = object
		elseif (var1 == 93) then-- Rear wheels
			object = dofile("./vehicles/wheels.lua")
			object.wheelPosition = 0
			newVehicle.rearWheels = object
			game.display_message("GOT WHEELS REAR!")
		elseif (var1 == 92) then-- Front bigfoot wheels
			object = dofile("./vehicles/wheels.lua")
			object.wheelPosition = 1
			newVehicle.frontWheels = object
			game.display_message("GOT WHEELS FRONT!")
		elseif (var1 == 91) then-- Rear bigfoot wheels
			object = dofile("./vehicles/wheels.lua")
			object.wheelPosition = 0
			newVehicle.rearWheels = object
		elseif (var1 == 90) then
			object = dofile("./vehicles/horsepower.lua")
			object.horsePosition = 1
			object.horseZ = 1
		elseif (var1 == 89) then
			object = dofile("./vehicles/horsepower.lua")
			object.horsePosition = 0
			object.horseZ = -1
		elseif (var1 == 88) then
			object = dofile("./vehicles/horsepower.lua")
			object.horsePosition = 1
			object.horseZ = 1
		elseif (var1 == 87) then
			object = dofile("./vehicles/horsepower.lua")
			object.horsePosition = 0
			object.horseZ = -1
		elseif (var1 == 86) then
			object = dofile("./vehicles/exhaust_pipe.lua")
			object.pipeType = 0
			object.pipeIntensity = 5
		elseif (var1 == 85) then-- Rear panel
			object = dofile("./vehicles/vehicle_door.lua")
			object.openingRotationZ = 180
			object.openingMoveY = 10
		elseif (var1 == 83) then
			object = dofile("./vehicles/flag_sword.lua")
		elseif (var1 == 82) then-- Left door
			object = dofile("./vehicles/vehicle_door.lua")
			object.openingRotationZ = -90
		elseif (var1 == 81) then-- Right door
			object = dofile("./vehicles/vehicle_door.lua")
			object.openingRotationZ = 90
		elseif (var1 == 73) or (var1 == 72) or (var1 == 71) then
			object = dofile("./vehicles/exhaust_pipe.lua")
			object.pipeType = 1
			object.pipeIntensity = 3
		elseif (var1 == 67) or (var1 == 65) then
			object = dofile("./vehicles/vehicle_mortar.lua")
		elseif (var1 == 63) then
			object = dofile("./vehicles/portcullis.lua")
		elseif (var1 == 60) then
			object = dofile("./vehicles/big_fuel_tank.lua")
		elseif (var1 == 59) then
			object = dofile("./vehicles/suspension.lua")
			object.suspensionPosition = 1
			newVehicle.vehicleInfo.hasSuspension = 1
		elseif (var1 == 58) then
			object = dofile("./vehicles/suspension.lua")
			object.suspensionPosition = 0
			newVehicle.vehicleInfo.hasSuspension = 1
		elseif (var1 == 57) or (var1 == 54) then-- Cargo doors
			object = dofile("./vehicles/vehicle_door.lua")
			object.openingRotationZ = 155
		elseif (var1 == 55) or (var1 == 52) then-- Cargo door buttons
			object = dofile("./vehicles/door_button.lua")
		elseif (var1 == 51) then
			object = dofile("./vehicles/MLRS_button.lua")
		elseif (var1 == 49) then
			object = dofile("./vehicles/MLRS_portcullis.lua")
		elseif (var1 == 48) then-- Machinegun Sphere
			object = dofile("./vehicles/machinegun.lua")
		elseif (var1 == 45) then-- Machinegun Button
			object = dofile("./vehicles/machinegun_button.lua")
		elseif (var1 == 45) then
			object = dofile("./vehicles/kill_barrier.lua")
			object.minDamagingSpeed = 100
			object.damage = 100
		elseif (var1 == 43) or (var1 == 42) then
			object = dofile("./vehicles/vehicle_collision.lua")
		end
	end
	-- elseif ...
	
	return object

end


local dicts = {}

local function getDictByName(name)

    if (dicts[name] == nil) then
        dicts[name] = game.dict_create()
        game.dict_load_file_json(dicts[name],name,0)
    end

    return dicts[name]
	
end



local function orra_child_type_is_enabled(vehicle_id, var1)
-- Check Jeep child
if vehicle_id == VEHICLE_TYPE_JEEP then
		-- Rear/Front Wheels
	if (var1 == 94) or (var1 == 93) then
		if settingJeepWheels == orra_jeep_wheels_setting_normie
		or settingJeepWheels == orra_jeep_wheels_setting_drift
		then return true end
		-- Machinegun Ball/Body/Seat/Button
	elseif (var1 == 48) or (var1 == 47) or (var1 == 46) or (var1 == 45) then
		if settingJeepLoad == orra_jeep_load_setting_machinegun
		or settingJeepLoad == orra_jeep_load_setting_machinegun_caged
		then return true end
		-- Flag/Sword
	elseif (var1 == 84) or (var1 == 83) then
		if settingJeepFlag == 1
		then return true end
		-- MLRS
	elseif (var1 == 51) or (var1 == 50) or (var1 == 49) then
		if settingJeepLoad == orra_jeep_load_setting_mlrs
		then return true end
		-- Heavy Window Grating
	elseif var1 == 75 then
		if settingJeepWindows == orra_jeep_window_grating_setting_heavy_grating
		or settingJeepWindows == orra_jeep_window_grating_setting_combined_grating
		then return true end
		-- Light Window Grating
	elseif var1 == 74 then
		if settingJeepWindows == orra_jeep_window_grating_setting_light_grating
		or settingJeepWindows == orra_jeep_window_grating_setting_combined_grating
		then return true end
		-- Bumper
	elseif var1 == 76 then
		if settingJeepBumper == 1
		then return true end
		-- Right/Left Door Grating
	elseif (var1 == 80) or (var1 == 79) then
		if settingJeepDoors == 1
		then return true end
		-- Hull Grating
	elseif var1 == 77 then
		if settingJeepHull == 1
		then return true end
		-- Madmax Intake
	elseif var1 == 70 then
		if settingJeepMadMax == orra_jeep_madmax_setting_intake_only
		or settingJeepMadMax == orra_jeep_madmax_setting_full_madmax
		then return true end
		-- Madmax Exhaust Pipes
	elseif (var1 == 73) or (var1 == 72) or (var1 == 71) then
		if settingJeepMadMax == orra_jeep_madmax_setting_exhaust_only
		or settingJeepMadMax == orra_jeep_madmax_setting_full_madmax
		then return true end
		-- Cage
	elseif var1 == 62 then
		if settingJeepLoad == orra_jeep_load_setting_roofless_open_cage
		or settingJeepLoad == orra_jeep_load_setting_open_cage
		or settingJeepLoad == orra_jeep_load_setting_prison_cage
		or settingJeepLoad == orra_jeep_load_setting_machinegun_caged
		then return true end
		-- Cage Roof
	elseif var1 == 61 then
		if settingJeepLoad == orra_jeep_load_setting_open_cage
		or settingJeepLoad == orra_jeep_load_setting_prison_cage
		then return true end
		-- Cage Portcullis
	elseif var1 == 63 then
		if settingJeepLoad == orra_jeep_load_setting_prison_cage
		then return true end
		-- Tower/Tower Collision
	elseif (var1 == 78) or (var1 == 42) then
		if settingJeepTower == orra_jeep_tower_setting_yes_tower
		or settingJeepTower == orra_jeep_tower_setting_tower_with_mortar
		then return true end
		-- Side Step Platforms
	elseif var1 == 69 then
		if settingJeepSideSteps == orra_jeep_side_steps_setting_platforms
		then return true end
		-- Side Step Stairs
	elseif var1 == 68 then
		if settingJeepSideSteps == orra_jeep_side_steps_setting_stairs
		then return true end
		-- Tower Mortar/Mortar Ammo
	elseif (var1 == 67) or (var1 == 66) then
		if settingJeepTower == orra_jeep_tower_setting_tower_with_mortar
		then return true end
		-- Load Mortar/Mortar Ammo
	elseif (var1 == 65) or (var1 == 64) then
		if settingJeepLoad == orra_jeep_load_setting_mortar
		then return true end
		-- Rear Panel
	elseif var1 == 85 then
		if settingJeepLoad ~= orra_jeep_load_setting_enclosed
		and settingJeepLoad ~= orra_jeep_load_setting_prison_cage
		and settingJeepLoad ~= orra_jeep_load_setting_fuel_tank
		then return true end
		-- Open Load
	elseif var1 == 98 then
		if settingJeepLoad ~= orra_jeep_load_setting_semienclosed
		and settingJeepLoad ~= orra_jeep_load_setting_enclosed
		then return true end
		-- Closed Load
	elseif var1 == 97 then
		if settingJeepLoad == orra_jeep_load_setting_semienclosed
		or settingJeepLoad == orra_jeep_load_setting_enclosed
		then return true end
		-- Cargo Door/Button/Hinge
	elseif var1 >= 52 and var1 <= 57 then
		if settingJeepLoad == orra_jeep_load_setting_enclosed
		then return true end
		-- Fuel Tank
	elseif var1 == 60 then
		if settingJeepLoad == orra_jeep_load_setting_fuel_tank
		then return true end
		-- Bigfoot Wheels/Suspension
	elseif (var1 == 92) or (var1 == 91) or (var1 == 59) or (var1 == 58) then
		if settingJeepWheels == orra_jeep_wheels_setting_bigfoot
		then return true end
		-- Horsepower -Z/+Z
	elseif (var1 == 90) or (var1 == 89) or (var1 == 88) or (var1 == 87) then
		if settingJeepWheels == orra_jeep_wheels_setting_horsepower
		then return true end
		-- Right/Left Door
	elseif (var1 == 82) or (var1 == 81) then return true
	elseif (var1 == 95) then return true -- Control Button
	elseif (var1 == 96) then return true -- Steering Wheel
	elseif (var1 == 99) then return true -- Base Body
	elseif (var1 == 100) then return true -- Root
	end
-- End Jeep
--elseif
end
--print("FALSE: "..var1)
return false -- if nothing true was returned, return false
end



local function validateArray(vehicle_id, array) 
    local newArray = {}

    for i = 1, #array do
        if orra_child_type_is_enabled(vehicle_id, array[i].var1) == false then
            array[i].isValid = false  -- помечаем руты как невалидные
			--game.display_message("invalid root")
		else
			array[i].isValid = true
        end
    end
	
    -- теперь отменяем детишек. Сорян, алгоритм максимально топорный будет
    local childrenCanceled = 1

    while childrenCanceled > 0 do -- если на последней итерации мы не смогли больше никого сделать невалидным, значит нет смысла продолжать цикл
        childrenCanceled = 0
        for i = 1, #array do
            if array[i].isValid == false then --нашли отменённый элемент
                for j = 1, #array do -- проходим все элементы заново чтоб найти тех кто ссылается на невалидный элемент
                    if (not (array[j].isValid == false)) and (array[j].var2 == array[i].var1) then
                        childrenCanceled = childrenCanceled + 1 -- нашли еще какого-то невалидного. Есть вероятность что от него унаследованы еще, поэтому продолжаем цикл.
                        array[j].isValid = false -- делаем очередного наследника невалидным
                    end
                end
            end
        end
    end

    -- теперь все невалидные элементы массива имеют поле isValid == false
    -- копируем валидных в новый массив
    for i = 1, #array do
        if not (array[i].isValid == false) then
            table.insert(newArray, array[i])
			--print("WRITTEN: "..array[i].var1)
        end
    end
    return newArray -- возвращаем только валидных
end




--[[
local function orra_register_child(root_prop,cur_child,var1,var2)
	-- Register Jeep
	if var2 == 35 then
		if var1 == 1 then
			local ControlButton = dofile("./vehicles/control_button_vehicle.lua")
			ControlButton.parentObject = newVehicle
			ControlButton.propId = cur_child
			newVehicle:addChild(ControlButton)
			-- Machinegun Ball/Body/Seat/Button
		elseif var1 == (12 or 13 or 14 or 44) then
			if	Machinegun == nil then
				local Machinegun = dofile("./vehicles/jeep_machinegun.lua")
				Machinegun.parentObject = newVehicle
				newVehicle:addChild(Machinegun)
			end
			-- Ball (root)
			if var1 == 12 then
				Machinegun.propId = cur_child
			-- Body
			elseif var1 == 13 then
				Machinegun[Body].propId = cur_child
			-- Seat
			elseif var1 == 14 then
				Machinegun[Seat].propId = cur_child
			-- Button
			elseif var1 == 44 then
				Machinegun[Button].propId = cur_child
			end
		elseif
		end
	end
end
--]]
function importVehicle(vehicleId)

	-- Spawning root
	local dict = getDictByName("vehicle" .. tostring(vehicleId))
	
	
	local itemsForSpawn = loadFromDict(dict)
	--game.display_message("items to spawn111: " .. tostring(#itemsForSpawn))
	
	
	local itemsForSpawn = validateArray(vehicleId, itemsForSpawn) -- получаем отфильтрованные пропы
	--game.display_message("items to spawn222: " .. tostring(#itemsForSpawn))
	-- спавним
	
	spawnItems(itemsForSpawn, dict)
	
	
	--game.display_message("items to spawn333: " .. tostring(#itemsForSpawn))
	
	--создаём обьект
	local newVehicle = dofile("vehicle_scripts/vehicle_object.lua")
	
	--пишем в обьект рут, взятый из файла
	newVehicle.propId = getRoot(itemsForSpawn).spawnedProp
	
	-- указываем тип транспорта и подгружаем обьект с инфой
	newVehicle.typeId = vehicleId -- типы смореть в vehicle_types.lua
	newVehicle.vehicleInfo = getVehicleInfo(newVehicle.typeId)

	-- парентим
	for i = 1, #itemsForSpawn do
		local item = itemsForSpawn[i]
		
		if item.var2 > 0 then -- если у нашего пропа вар2 ненулевой, значит он от кого-то унаследован
			-- ищем проп с таким варом
			for j = 1, #itemsForSpawn do
				local item2 = itemsForSpawn[j]
				if item.var2 == item2.var1 then -- нашли
					setParent(item.spawnedProp, item2.spawnedProp) -- проп второго айтема назначаем родителем первого
					--game.display_message("found parent " .. tostring(item.var2) .. " for child " .. tostring(item.var1)) 
					goto skip -- родитель найден, выходим из подцикла
				end
				
			end
			
			game.display_message("ERROR: cannot find parent with id " .. tostring(item.var2) .. " for child " .. tostring(item.var1)) 
		    ::skip::
			
		end
	end
	
	
        -- если во время импорта мы увидим, что обьекту принадлежат колёса, или
    -- пропеллеры, или еще что, то добавляет их специальными обьектами

    for i = 1, #itemsForSpawn do
        local newObject = getLogicObject(newVehicle, itemsForSpawn[i].var1)
        if newObject then
            newObject.propId = itemsForSpawn[i].spawnedProp -- указываем рут проп. Нужно чтоб могли двигать его отдельно от парента
			local id = addLogicObject(newObject)
			scene_prop_set_slot(itemsForSpawn[i].spawnedProp,orra_prop_object_id,id) -- set slot for button to reverse search its parent
			newObject.parentObject = newVehicle -- указываем парента
				if newObject.skipParenting ~= nil
				then print"DO THAT" else newVehicle:addChild(newObject) -- добавляем в список наследников транспорта
				end
        end
    end
	
	
	
	-- устанавливаем наследование уже среди логических обьектов, опираясь на отношения их prop-ов
	for i, child in ipairs(newVehicle.children) do

		
		-- ищем наш проп
		local item = nil
		for i = 1, #itemsForSpawn do
			if itemsForSpawn[i].spawnedProp == child.propId then
				item = itemsForSpawn[i] -- нашли наш проп
			end
		end
		
		
	    -- ищем проп-родителя
		local parentItem = nil
		for i = 1, #itemsForSpawn do
			if itemsForSpawn[i].var1 == item.var2 then
				parentItem = itemsForSpawn[i] -- нашли проп родителя
			end
		end
		
		-- теперь ищем логику в которой этот проп указан как рут
		for i = 1, #newVehicle.children do
			if newVehicle.children[i].propId == parentItem.spawnedProp then -- нашли чилдрена у которого искомый проп указан как рут
				child.parent = newVehicle.children[i] -- делаем его парентом
			end
		end
		
		
	end
	
	
	

	-- добавляем транспорт в список всех транспортов
	addVehicle(newVehicle)
	
	game.init_position(0)
	game.set_fixed_point_multiplier(1000)
	game.position_set_x(0, 125000)
	game.position_set_y(0, 125000)
	
	game.display_message("Root id: " .. tostring(newVehicle.propId))
	--setPosition(newVehicle.propId, 0)
	
	
	
end

--importVehicle(VEHICLE_TYPE_JEEP)

for i, value in ipairs(gamemodes) do
	addTrigger(value, 0, 0, 2, function() return game.key_clicked(game.const.key_h)end, --3
	function() 
	importVehicle(VEHICLE_TYPE_JEEP)
	game.display_message("Import") 
	end)
end


for i, value in ipairs(gamemodes) do
	addTrigger(value, 0, 0, 2, function() return game.key_clicked(4)end, --4
	function() 
		
		
		
		game.init_position(0)
		
		
		
		

    --do return end

	game.init_position(0)
	game.set_fixed_point_multiplier(1000)
	
	game.position_move_x(0, 12500)
	game.position_move_y(0, 12500)
	game.position_move_z(0, 500)
	
	
	game.position_rotate_x(0, math.random(360))
	game.position_rotate_z(0, math.random(360))
	game.position_rotate_y(0, math.random(360))
	game.position_rotate_z(0, math.random(360))
	game.position_rotate_y(0, math.random(360))
	game.position_rotate_x(0, math.random(360))
	
	
	    --[[for key, value in pairs(game.preg[0]) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		
		
		for key, value in pairs(game.preg[0].o) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		
		
		for key, value in pairs(game.preg[0].rot) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end]]
		
		
		for key, value in pairs(game.preg[0].rot.f) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		for key, value in pairs(game.preg[0].rot.s) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		for key, value in pairs(game.preg[0].rot.u) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		
		
	local x = game.position_get_rotation_around_x(0, 0)
	local y = game.position_get_rotation_around_y(0, 0)
	local z = game.position_get_rotation_around_z(0, 0)

	game.init_position(1)
	game.set_fixed_point_multiplier(1000)
	
	game.position_move_x(1, 12700)
	game.position_move_y(1, 12500)
	game.position_move_z(1, 500)
	
	





	game.preg[1].rot.f.x = game.preg[0].rot.f.x
	game.preg[1].rot.f.y = game.preg[0].rot.f.y
	game.preg[1].rot.f.z = game.preg[0].rot.f.z
	
	game.preg[1].rot.s.x = game.preg[0].rot.s.x
	game.preg[1].rot.s.y = game.preg[0].rot.s.y
	game.preg[1].rot.s.z = game.preg[0].rot.s.z
	
	game.preg[1].rot.u.x = game.preg[0].rot.u.x
	game.preg[1].rot.u.y = game.preg[0].rot.u.y
	game.preg[1].rot.u.z = game.preg[0].rot.u.z
	
	local newRot = game.rotation.new(game.preg[0].rot)
	game.display_message("..........: " .. tostring(game.preg[0].rot.f.x))
	game.preg[0].rot.f.x = 0.5
	game.display_message("..........: " .. tostring(game.preg[0].rot.f.x))
	


		game.preg[1] = game.pos.new({o = {x=125, y = 127, z = 5}, rot = {
		s = {x = game.preg[0].rot.s.x, y = game.preg[0].rot.s.y, z = game.preg[0].rot.s.z},
								 f = {x = game.preg[0].rot.f.x, y = game.preg[0].rot.f.y, z = game.preg[0].rot.f.z},
								 u = {x = game.preg[0].rot.u.x, y = game.preg[0].rot.u.y, z = game.preg[0].rot.u.z},
		
		}})

	
	
	game.display_message("..........: " .. tostring(game.preg[1].rot.f.x))
	for key, value in pairs(game.preg[1].rot.f) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		for key, value in pairs(game.preg[1].rot.s) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
		for key, value in pairs(game.preg[1].rot.u) do
			game.display_message("key: " .. tostring(key) .. ", value: " .. tostring(value))
		end
	
	
	
	
	
	
		
	game.set_spawn_position(0)
	game.spawn_scene_prop(1500) 
	
	game.set_spawn_position(1)
	game.spawn_scene_prop(1500) 
		
	local spawnedProp = game.reg[0] -- добавляем для айтема еще одно поле которое хранит id заспавненого пропа
		

		
		
		
		
	end)
end



for i, value in ipairs(gamemodes) do
	addTrigger(value, 0, 0, 0, function() return game.key_clicked(5)end, 
	function() 
		for props in game.propInstI() do
			game.display_message(tostring(game.prop_instance_get_variation_id(0, props)))
			
		end
	end)
end