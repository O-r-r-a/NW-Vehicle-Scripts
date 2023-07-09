-- обьект-драйвер для управления всеми транспортами в игре. Обратиться к транспортам, или создать их можно только через него


local vehicles = {} -- просто локальный список, проходите мимо
local logicObjects = {}

-- глобальная функция для регистрации транспорта, на вход принимает обьект транспорта. 
function addVehicle(newVehicle) 

	table.insert(vehicles,newVehicle)
	
end

-- глобальная функция для регистрации логик объекта, на вход принимает логик обьект. 
function addLogicObject(newLogicObject) 

	table.insert(logicObjects,newLogicObject)
	return #logicObjects
	
end

function getObjectById(id)
      return logicObjects[id]
end

-- handle any prop use
function handleUseProp(agentID,prop)
	local objectID = scene_prop_get_slot(0,prop,orra_prop_object_id)
	if objectID > 0 then
	object = getObjectById(objectID)
	object:use(agentID)
	end
end

-- handle any door use
function handleStartUseDoor(agentID,doorProp)
	local doorID = scene_prop_get_slot(0,doorProp,orra_prop_object_id)
	if doorID > 0 then
	Object = getObjectById(doorID)
	Object.parentObject:setDriver(agentID)
	end
end

-- handle any door use
function handleCancelUseDoor(agentID,doorProp)
	local doorID = scene_prop_get_slot(0,doorProp,orra_prop_object_id)
	if doorID > 0 then
	Object = getObjectById(doorID)
	Object.parentObject:setDriver(agentID)
	end
end

-- мы вызываем эту функцию если хотим сообщить драйверу что какой-то агент взял контроль над транспортом, в данный момент в качестве айди транспорта даём его рут
function agentSetVehicleControl(agentId, vehicleId)
	
	for vehicle in ipairs(vehicles) do
		if vehicle.propId == vehicleId then
			vehicleId:setDriver(agentId) -- просто вызываем соответствующую функцию у нужного транспорта
			return
		end
	end
end


-- мы вызываем эту функцию если хотим сообщить драйверу что какой-то агент прекратил контроль над транспортом, в данный момент в качестве айди транспорта даём его рут
function agentStopVehicleControl(agentId, vehicleId)
	
	for vehicle in ipairs(vehicles) do
		if vehicle.propId == vehicleId then
			vehicleId:stopDriver(agentId) -- на всякий случай, сообщаем какой именно агент, а то вдруг мы сделаем несколько водителей
			return
		end
	end
	
end


-- вызываем каждый кадр update каждого транспорта чтоб они могли выполнять свою логику. Указан левый шаблон, внимантельно
addTriggerBS(0.3, 0, 0, function ()

	for i, vehicle in pairs(vehicles) do
		vehicle:update()
	end
	
end)


