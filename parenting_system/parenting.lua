Object = {objectID = -1, parent = nil, children = {}, dict = -1, objectsList = objectsXYM3Z, animationSpeed = 30, rotationAroundX = 0}

local prop_instance_is_valid = game.prop_instance_is_valid
local init_position = game.init_position
local prop_instance_get_position = game.prop_instance_get_position
local prop_instance_set_position = game.prop_instance_set_position
local position_transform_position_to_local = game.position_transform_position_to_local
local position_transform_position_to_parent = game.position_transform_position_to_parent
local dict_create = game.dict_create
local dict_set_pos = game.dict_set_pos
local dict_get_pos = game.dict_get_pos
local dict_erase = game.dict_erase
local dict_free = game.dict_free
local position_get_x = game.position_get_x
local position_get_y = game.position_get_y
local position_get_z = game.position_get_z
local position_move_x = game.position_move_x
local position_move_y = game.position_move_y
local position_move_z = game.position_move_z
local position_rotate_x = game.position_rotate_x
local position_rotate_y = game.position_rotate_y
local position_rotate_z = game.position_rotate_z
local position_rotate_x_floating = game.position_rotate_x_floating
local position_rotate_y_floating = game.position_rotate_y_floating
local position_rotate_z_floating = game.position_rotate_z_floating
local prop_instance_get_animation_target_position = game.prop_instance_get_animation_target_position



--Ищет и возвращает объект с заданным айди среди самого объекта и его наследников
function Object:searchObject(objectID)

  --[[local parent = nil
  
  if self.objectID == objectID then
    return self
  end
  
  for k, object in pairs(self.children) do
   game.display_message("search " .. tostring(object.objectID) .. " in " .. tostring(objectID))
    parent = object:searchObject(objectID)
	
	if parent ~=nil then 
	  --break
	end
  
  end
  
  return parent]]
  
  return objectsXYM3Z[objectID]
  
  
end





function Object:addChild(childID)
  
  local ret = false
  
  if self.objectID ~= -1 then
  if prop_instance_is_valid(childID) == false then
    ret = true
  
  end
  end
  
  if ret then 
	--game.display_message("return because invalid prop")
	return 
  end
  
  local newChild = self:searchObject(childID)
  
  if newChild == nil then
    newChild = dofile("parenting_system/parenting.lua")
	newChild.animationSpeed = self.animationSpeed
    newChild.objectID = childID
  else
	if newChild.parent ~= nil then
	end
  
  end

  newChild.parent = self
  self:initPos(newChild, childID)
  
  self.children[#self.children + 1] = newChild
  
  objectsXYM3Z[childID] = newChild

end



function Object:initPos(newChild, childID)


  if self.objectID == -1 then
     init_position(0)
  else
     prop_instance_get_position(0, self.objectID)
  end
  
  prop_instance_get_position(1, childID)
  
    
  position_transform_position_to_local(2,0,1) -- # Converts position from local coordinate space to parent coordinate space. In other words, if you have some position on the scene (anchor) and a position describing some place relative to anchor (for example [10,20,0] means "20 meters forward and 10 meters to the right"), after calling this operation you will get that position coordinates on the scene in <position_dest>. Rotation and scale is also taken care of, so you can use relative angles.
	
  if newChild.dict == -1 then
   

	newChild:createDict()

  end
  
  --game.display_message("now dict is " .. tostring(newChild.dict))
  dict_set_pos(newChild.dict, tostring(childID), 2)
	

end



function Object:setParent(childID, parentID)
 -- game.display_message("try set parent " .. tostring(childID) .. " " .. tostring(parentID))
  if prop_instance_is_valid(childID) and prop_instance_is_valid(parentID) then
  
  else
    return
  end
  

  local object = self:searchObject(childID)
  local object2 = self:searchObject(parentID)
  
  if object ~= nil then -- если ребенок уже зарегистрирован в системе ...
	object:clearLink(object, object.parent) -- ..., прежде, чем выдать родителю ребенка, удаляем все связи с его старым родителем
  end
  
  if object2 ~= nil then --если ребенок зарегистрирован

	 --game.display_message("adding child " .. tostring(childID) .. " to parent " .. tostring(parentID))
	object2:addChild(childID)
	
  else 
  
   --game.display_message("no parent, making parent " .. tostring(parentID))
     self:addChild(parentID)
	 self:setParent(childID, parentID)
  
  end
  
  

end



function Object:createDict()
	
	self.dict = dict_create(0)

end


--[[function Object:clearParent(childID)

  local object = self:searchObject(childID)
  
  if object ~= nil then
  
    if object.parent ~= nil then
	 game.display_message("clear parent()")
	  object.parent:clearChild(childID)
	end
   
  end

end
]]

--[[function Object:clearChild(childID)


  if self ~= nil then
  
    local childDeleted = false
    for i = 1, #self.children do
	
	  if self.children[i].objectID == childID then
	    childrenDeleted = true
		--self.children[i]:addObjectToRoot()
		--self.children[i].dict = -1
		--self.children[i].parent = nil
		--setParent(childID, self.objectID, rootObject.objectID)
		--game.display_message("clear child()")
	    --dict_erase(self.dict, tostring(childID))
		
		
	  end
	  
	  if childDeleted then
	  
	    if i == #self.children then
		  self.children[#self.children] = nil
		  break
		end
		
		self.children[i] = self.children[i+1]
	  
	  end
	
	end
  
  end

end]]



function Object:clearLink(childObject, parentObject)

    --вычищаем следы ребенка у родителя
  
    if parentObject ~= nil and childObject ~= nil then
		local childDeleted = false
		for i = 1, #parentObject.children do
	
			if parentObject.children[i].objectID == childObject.objectID then
			table.remove(parentObject.children, i)
			break

			end
		end
	end
	
	--вычищаем следы родителя у ребенка
	
	if childObject ~= nil then
		childObject.parent = nil
	end
	
	--childrenObject:addObjectToRoot()
		--self.children[i].dict = -1
		--self.children[i].parent = nil
		--setParent(childID, self.objectID, rootObject.objectID)
		--game.display_message("clear child()")
	    --dict_erase(self.dict, tostring(childID))
end


function Object:child_clear_parent(childID)

	if childID == -1 then return end -- у рута не может быть родителя
	local childObj = self:searchObject(childID)
	if childObj == nil then return end
	if childObj.parent == nil then return end -- и так нет родителя
	if childObj.parent.objectID == -1 then return end  --удалить родителя это то же, что сделать родителем рут
	
	self:clearLink(childObj, childObj.parent)
	self:addObjectToRoot()
	
	

end

function Object:addObjectToRoot()

	self.clearLink(self, self.parent)

	self.parent = rootObject
	rootObject.children[#self.children + 1] = newChild
	rootObject:initPos(self, self.objectID)

end



function Object:clearChildren(parentID)

  local object = self:searchObject(parent)
  
  if object ~= nil then
  
  for i = #object.children, 1, -1 do
	object.children[i]:child_clear_parent(object.children[i].objectID)
  end
  
  end
end



function Object:setPosition(objectID, positionID)

	local object = self:searchObject(objectID)
	if object == nil then return end
	if prop_instance_is_valid(object.objectID) == false then return end
	--game.display_message(tostring(object.objectID))
	local x = prop_instance_set_position(objectID, positionID)
	object.parent:initPos(object, objectID)


end


function Object:move(id, xx, yy, zz)

  if prop_instance_is_valid(id) == false then
  
    --game.display_message("prop instance " .. tostring(id) .. " is invalid")
    return
  end
 
  object = self:searchObject(id)
  
  if object == nil then return end
  
 

  dict_get_pos(0, object.dict, tostring(object.objectID))
  position_move_x(0, xx)
  position_move_y(0, yy)
  position_move_z(0, zz)
 
  dict_set_pos(object.dict, tostring(object.objectID), 0)

  
  
end


function Object:updatePosition(teleport)

  if prop_instance_is_valid(self.objectID) == false then
    return
  end
 
  --game.display_message("position update in " .. tostring(self.objectID))
  --x = game.display_message("my x: " .. tostring(game.position_get_x(0, 2)) .. ", my y: " .. tostring(game.position_get_y(0, 2)) .. ", my z: " .. tostring(game.position_get_z(0, 2)))

	
	
	if not (self.rotationAroundX == 0) then
			self.parent:initPos(self, self.objectID)
	end
	dict_get_pos(0, self.dict, tostring(self.objectID))
  

	if self.parent.objectID == -1 then
		--init_position(1)
	else
        --prop_instance_get_position(1, self.parent.objectID)
		
		
		dict_get_pos(1, self.parent.dict, tostring(self.parent.objectID))
		
	end
  
    --x = game.display_message("parent x: " .. tostring(game.position_get_x(0, 1)) .. ", parent y: " .. tostring(game.position_get_y(0, 1)) .. ", parent z: " .. tostring(game.position_get_z(0, 1)))

  
	if self.parent ~= nil and  (prop_instance_is_valid(self.parent.objectID) or self.parent.objectID == -1) then
	  
		if teleport == 1 then
			if self.parent.objectID ~= -1 then
				position_transform_position_to_parent(2, 1, 0)
			    prop_instance_set_position(self.objectID, 2)
			else
				prop_instance_set_position(self.objectID, 0)
			end
		
		else
		
			game.prop_instance_stop_animating(self.objectID)
			if self.parent.objectID ~= -1 then
				position_transform_position_to_parent(2, 1, 0)
			--prop_instance_set_position(self.objectID, 2)
			
				if not (self.rotationAroundX == 0) then
					game.prop_instance_rotate_to_position(self.objectID, 2, self.animationSpeed, self.rotationAroundX)
				else
					game.prop_instance_animate_to_position(self.objectID, 2, self.animationSpeed)
				end
			else
			--prop_instance_set_position(self.objectID, 0)
				game.prop_instance_animate_to_position(self.objectID, 0, self.animationSpeed)
			end
		
		end
		
		
		
      
	  --game.prop_instance_stop_animating(self.objectID)
	  --game.prop_instance_animate_to_position(self.objectID, 2, 1)
	  
	  --game.display_message("new x: " .. tostring(game.position_get_x(0, 2)) .. ", new y: " .. tostring(game.position_get_y(0, 2)) .. ", new z: " .. tostring(game.position_get_z(0, 2)))

	
  else
		return
  end
 
  
  for k, object in pairs(self.children) do
  
    object:updatePosition(teleport)
  
  end
  
end 




function Object:rotate(id, xx, yy, zz)

  if prop_instance_is_valid(id) == false then
    return
  end
 
  object = self:searchObject(id)
  
  if object == nil then return end
  
 

  dict_get_pos(0, object.dict, tostring(object.objectID))
  position_rotate_x(0, xx)
  position_rotate_y(0, yy)
  position_rotate_z(0, zz)
 
  dict_set_pos(object.dict, tostring(object.objectID), 0)
  
  
end   


function Object:rotateFloating(id, xx, yy, zz)
  if prop_instance_is_valid(id) == false then
    return
  end
 
  object = self:searchObject(id)
  
  if object == nil then return end
  
 

  dict_get_pos(0, object.dict, tostring(object.objectID))
  position_rotate_x_floating(0, xx)
  position_rotate_y_floating(0, yy)
  position_rotate_z_floating(0, zz)
 
  dict_set_pos(object.dict, tostring(object.objectID), 0)
  
  
end  


function Object:translate(objectID, positionID)

	local object = self:searchObject(objectID)
	if object == nil then return end
	if prop_instance_is_valid(object.objectID) == false then return end
	
	local x, y, z = position_get_x(0, positionID), position_get_y(0, positionID), position_get_z(0, positionID)

	

	object:move(object.objectID, x, y, z)

end


-- TODO
function Object:scale()

end

return Object
