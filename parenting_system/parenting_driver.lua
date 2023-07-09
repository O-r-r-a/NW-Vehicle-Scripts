

objectsXYM3Z = {}

rootObject = dofile("parenting_system/parenting.lua")
rootObject.animationSpeed = 30

local display_message = game.display_message
local prop_instance_set_position = game.prop_instance_set_position

local fixedPoint = 1000

function setParent(childID, parentID)

	rootObject:setParent(childID, parentID)
	if objectsXYM3Z[parentID] == nil then
		objectsXYM3Z[parentID] = rootObject:searchObject(parentID)
	end
	if objectsXYM3Z[childID] == nil then
		objectsXYM3Z[childID] = rootObject:searchObject(childID)
	end
	
	if objectsXYM3Z[childID] == nil or objectsXYM3Z[parentID] == nil then
		display_message("Error in setParent(). Parent " .. tostring(parentID) .. " or child " .. tostring(childID) .. "  instance is invalid!")
		return
	end
	

end


function clearParent(childID)
	if objectsXYM3Z[childID] == nil then
		display_message("Error in clearParent(). Child instance is invalid or have no parents!")
		return
	end
	if objectsXYM3Z[childID].parent == nil then
		display_message("Error in clearParent(). Child instance is invalid or have no parents!")
		return
	end
	
	objectsXYM3Z[childID]:child_clear_parent(childID)
	
	

end


function clearChildren(parentID)
	if objectsXYM3Z[parentID] == nil then
		display_message("Error in clearChildren(). parent is not exist!")
		return
	end
	objectsXYM3Z[parentID]:clearChildren(parentID)
end


function setPosition(objectID, positionID, teleport)
	local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in setPosition(). object is not exist!")
		return
	end
	object:setPosition(objectID, positionID)
	object:updatePosition(teleport)

end


function move(objectID, x, y, z, teleport)
    local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in move(). object is not exist!")
		return
	end
	
	object:move(objectID, x, y, z)
	object:updatePosition(teleport)


end


function rotate(objectID, x, y, z, teleport)

    local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in rotate(). object is not exist!")
		return
	end
	
	object:rotate(objectID, x, y, z)
	object:updatePosition(teleport)
	
end


function rotateFloating(objectID, x, y, z, teleport)

    local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in rotateFloating(). object is not exist!")
		return
	end
	
	object:rotateFloating(objectID, x, y, z)
	object:updatePosition(teleport)
	
end


function moveRotate(objectID, mx, my, mz, rx, ry, rz, teleport)
	local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in moveRotate(). object is not exist!")
		return
	end
	object:move(objectID, mx, my, mz)
	object:rotate(objectID, rx, ry, rz)
	object:updatePosition(teleport)

end


function translate(objectID, positionID, teleport)
	local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in translate(). object is not exist!")
		return
	end
	object:translate(objectID, positionID)
	object:updatePosition(teleport)
end


function updatePositions(objectID, teleport)

	local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in updatePosition(). object is not exist!")
		return
	end
    object:updatePosition(teleport)


end


function setAnimationSpeed(newAnimationSpeed)

	rootObject.animationSpeed = newAnimationSpeed


end


function clearAllDepencies()

	for k in pairs(objectsXYM3Z) do
		objectsXYM3Z[k] = nil
	end


end

function setRotationSpeed(objectID, newSpeed)
	local object = objectsXYM3Z[objectID]
	if object == nil then
		display_message("Error in setRotationSpeed(). object is not exist!")
		return
	end
	object.rotationAroundX = newSpeed

end







