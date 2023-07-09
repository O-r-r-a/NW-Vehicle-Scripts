local object = {
propId = 0,
parentObject,
openingRotationZ = 90,
openingMoveY = 0
}
--[[
local function object:update()
	if 
	
	if agent_is_active(self.parentObject.driverId == true
	and agent_is_alive(self.parentObject.driverId) == true
	and agent_is_human(self.parentObject.driverId) == true
	and agent_is_non_player(self.parentObject.driverId) == false
	and (agent_get_horse(0,self.parentObject.driverId)) == -1 then
		if self.parentObject.vehicleInfo.requiredPilotAnimation ~= nil then
			if (agent_get_animation(0,self.parentObject.driverId)) ~= self.parentObject.vehicleInfo.requiredPilotAnimation
			then self.parentObject:stopDriver break end
		end
	prop_instance_get_position(11,self.rootId)
	agent_get_position(10,self.parentObject.driverId)
    local dist = get_distance_between_positions(10,11)
		if dist => self.parentObject.vehicleInfo.maxDistFromPilot
		then self.parentObject:stopDriver break end
	else self.parentObject:stopDriver break end
end

local function object:use(agentID)
	--Object.newUser = agentID
	--self.parentObject:setDriver(agentID)
end
--]]


return object