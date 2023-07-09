-- пример обьекта наследника, в котором реализована собственная логика

-- тут мы храним список полей, свойственных для каждого ЭКЗЕМПЛЯРА
local object = {
rootId = 0, -- наш рут
parentObject, -- наш парент
isFrontWheel,
radius = 100
-- ... остальные произвольные значения
}

--наша логика.
local function object:update()
	--обращаемся к паренту так
	-- if self.parentObject.speedVector.x > 0 ...
	-- if self.parentObject.vehicleInfo.wheelRadius > 0 ...
end


return object