-- все функции данного обьекта вызываются драйвером, за исключением функции addChild, которая нужна при инициализации

-- тут мы храним список полей, свойственных для каждого ЭКЗЕМПЛЯРА транспорта
local object = {
typeId = 0,
propId = 0,
vehicleInfo, -- обьект, хранящий все свойства конкретного ТИПА транспорта. Обьявляются в vehicle_types.lua
driverId = 0, -- вопрос, что брать за айди, игрока или агента, можно добавить и то и то в принципе
speedVector = {x, y, z},
velocityVector = {x, y, z},
children = {}, -- список детишек
throttleAcceleration = 0,
yawAcceleration = 0,
thrust = 3,
suspensionRotX = 0
}

-- выполняем логику, свойстенную конкретно для машин. Проверяем управление водителя, и т.д., меняем вектор ускорения. Но нежелательно менять непосредственно скорость,
-- так как мы сделаем это в универсальном методе updateSpeed(), так как принцип будет аналогичный для всех транспортов
function object:carLogic()

-- Check if pilot is still valid to control. Unassign pilot if false.
if agent_is_active(self.driverId) == true
or self.thrust ~= 0
-- Check if authonomous animation is needed.
--or animation_conditions_check(self) == true
then else return end

-- Get input from the driver.
jerk, yawJerk = interpret_input(self)
yawJerk = yawJerk * -1
-- Get yaw
self.yaw,self.yawAcceleration = get_acceleration_curve(yawJerk,self.yawAcceleration,
self.vehicleInfo.yawAccelerationTime,self.vehicleInfo.yawAccelerationCurve,self.vehicleInfo.yawMaxSpeed)

-- Get throttle
self.throttle,self.throttleAcceleration = get_acceleration_curve(jerk,self.throttleAcceleration,
self.vehicleInfo.throttleAccelerationTime,self.vehicleInfo.throttleAccelerationCurve,self.vehicleInfo.throttleMaxSpeed)
print("yaw "..self.yaw.." yaw acc: "..self.yawAcceleration.." yawJerk: "..yawJerk)
print("throttle "..self.throttle.." thr acc: "..self.throttleAcceleration.." jerk: "..jerk)

--***********************************--
-- Now, get to the real deal - physics!

local turn_z = self.yaw --TEMPORAL!! When midair, rotation shouldn't be affected

--Get necessary positions
prop_instance_get_position(11,self.rearWheels.propId)
prop_instance_get_position(12,self.frontWheels.propId)
init_position(15)-- pos15 - blank 000 pos
prop_instance_get_position(35,self.propId)-- pos35 - root pos before wheel rays
local Rear_Z = position_get_z(0,11)
local Front_Z = position_get_z(0,12)

--TP props to prevent from obstacling wheels in aligning and casting rays
--call_script("orra_animate_vehicle_to_pos",root,15,3)
---^^^PLACEHOLDER!!!^^^
--setPosition(object.propId,15)


--Gravitational bonus/penalty & first introduction of thrust theme
X_Rot = position_get_rot_x(0,11)
local grav_sin = sin(X_Rot)
if -0.120 <= grav_sin and grav_sin <= 0.120 then-- Too small SIN - don't bother to fix wiggling on one place
grav_sin = 0
end
self.thrust = self.thrust + (grav_sin/2.1739130434782608695652173913043)

--Drifting PROBABLY WILL BE REPLACED WITH VECTOR!!!!!!
RotateZ (11,(-turn_z * (self.thrust/441)))-- 441 - Max thrust w/no g

--Rear wheels: Move, Align, and handle Freefall
position_move_y(11,self.thrust)
position_align_to_ground(11,1,1)
local Rear_Z_delta = position_get_z(0,11) - Rear_Z
if Rear_Z_delta < 0 then
self.rearWheels.freefallCounter = self.rearWheels.freefallCounter + 1
local fall_speed = self.rearWheels.freefallCounter * -1000000 -- g/100 * 30 = 2.943 but i dont need it
local Rear_Z_delta_clamped = (clamp(Rear_Z_delta,fall_speed,-1))
Rear_Z = Rear_Z + Rear_Z_delta_clamped
	if Rear_Z_delta_clamped == Rear_Z_delta then self.rearWheels.freefallCounter = 0 end
position_set_z(11,Rear_Z)
else
self.rearWheels.freefallCounter = 0
end

--Rear wheels: Fix Z and X rot after Alignment
position_rotate_x(11,-90)
self.rearWheels.rotZ = self.rearWheels.rotZ + turn_z
RotateZ (11,(self.rearWheels.rotZ - position_get_rot_z(0,11)))

--Pitch up if there's an obstacle between Front and Rear wheels
--WHEELS DISTANCE = 5.9360357129
position_move_z(11,100)
if cast_ray(0,12,11) == true then
local ray_dist = g.preg[11].o:dist(g.preg[12].o)
position_move_z(11,-100)
	if ray_dist < 5.93 then    --ray_dist
	local ray_acos = acos(ray_dist / 5.93)
	RotateX (11,ray_acos)
	end
else
position_move_z(11,-100)
end

--Front wheels: Offset from rear_wheels and fix strafing via ray
copy_position(12,11)
position_move_y(12,593)
position_move_z(12,200)
position_rotate_x(12,-90)
if cast_ray(unused,12,12) == true then
position_copy_rotation(12,11)
else position_move_z(12,-200) position_rotate_x(12,90)-- Impossible scenario (?FW over abyss)
end

--VACANT SPACE FOR ROLL SMOOTHENING

--Put wheel edges on the ground
position_move_z(11,self.rearWheels.wheelRadius) position_move_z(12,self.frontWheels.wheelRadius)

--Front wheels: Handle freefall
local Front_Z_delta = position_get_z(0,12) - Front_Z
if Front_Z_delta < 0 then
self.frontWheels.freefallCounter = self.frontWheels.freefallCounter + 1
local fall_speed = self.frontWheels.freefallCounter * -1000000
local Front_Z_delta_clamped = (clamp(Front_Z_delta,fall_speed,-1))
Front_Z = Front_Z + Front_Z_delta_clamped
	if Front_Z_delta_clamped == Front_Z_delta then
	self.frontWheels.freefallCounter = 0 end
position_set_z(12,Front_Z)
else
self.frontWheels.freefallCounter = 0
end

--Hold 593 gap for front wheels; put root pos in middle
position_get_vector_to_position(0,12,11,12)
copy_position(50,12)
position_move_y(50,296)--296.5
position_move_y(12,593)
position_copy_rotation(12,11)
position_rotate_y(50,position_get_rot_y(0,12))

--Suspension
if self.vehicleInfo.hasSuspension == 1 then
local X_Rot_after_landing = fix360(position_get_rot_x(0,11) - X_Rot)
local sus_delta = X_Rot_after_landing - self.suspensionRotX
	if -2 <= sus_delta and sus_delta <= 2 then
	sus_delta = clamp(sus_delta,-1,1)
	else
	sus_delta = sus_delta / 2
	end
self.suspensionRotX = clamp((self.suspensionRotX + sus_delta),-10,10)
local sus_z_weight = math.abs(self.suspensionRotX) * -1
position_move_z(50,sus_z_weight)
position_rotate_x(50,self.suspensionRotX)
end

--Animate wheels and root!
prop_instance_animate_to_position(self.frontWheels.propId,12,29)
prop_instance_animate_to_position(self.rearWheels.propId,11,29)
--setPosition(object.propId,35)
--call_script("orra_animate_vehicle_to_pos",root,35,3,0)
position_move_z(50,self.vehicleInfo.offsetZFromWheelsToRoot)
--call_script("orra_animate_vehicle_to_pos",root,50,1,29)
end

function object:helicopterLogic()
	
end

function object:planeLogic()
	
end


-- по логике, здесь мы просто применяем наш вектор ускорения к текущей скорости
function object:updateSpeed()
	self.thrust = self.throttle
	print(self.thrust.." is our future")
end

-- эта функция будет вызвана драйвером, если игрок станет водителем. 
function object:setDriver(agentId)
	self.driverId = agentId
--  ... свистоперделки	
end

-- эта функция будет вызвана драйвером, если игрок прекратит быть водителем. 
function object:stopDriver()--agentId
		self.driverId = -1
--  ... свистоперделки	
end

-- вызываем если хотим добавить наследника
function object:addChild(newChild)
	table.insert(self.children, newChild)
end

-- функция-дирижёр. Здесь очень желательно не ыфполнять какую-то специфическую логику. Лучше пользоваться отдельными функциями
function object:update()

	-- проверяем тип
	if self.vehicleInfo.isCar == true then
		object:carLogic()
	elseif self.vehicleInfo.isHelicopter == true then
		object:helicopterLogic()
	elseif self.vehicleInfo.isPlane == true then
		object:planeLogic()
	end
	
	
    object:updateSpeed() -- по логике, этот метод универсален для всех транспортов, нет смысла вызывать его индивидуально


	for i, child in pairs(object.children) do
		--child:update() -- логика наследников реализована в них самих, мы от них абстрагированы
	end
end

-- возвращаем обьект
return object