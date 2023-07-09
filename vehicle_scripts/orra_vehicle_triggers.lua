display_message "Running vehicle triggers..."

function orra_vehicle_trigger_animation_conditions (var2, root)
local animate = false
if var2 == 35 then -- VTOL or Jeep
	door = getPropSlot(root,orra_vehicle_door)
	if prop_instance_is_valid(door) == true
	and scene_prop_slot_eq(door,orra_vehicle_door_state,0) == false
	and scene_prop_slot_eq(door,orra_vehicle_door_state,1) == false
	then animate = true--or door stuff, optimize it by using checking door anim slot in root
	else door = getPropSlot(root,orra_vehicle_reverse_door)
	if prop_instance_is_valid(door) == true
	and scene_prop_slot_eq(door,orra_vehicle_door_state,0) == false
	and scene_prop_slot_eq(door,orra_vehicle_door_state,1) == false
	then animate = true end
	end
end
return animate
end

function orra_vehicle_trigger_get_control_input (var2, button, using_agent)
local pitch = 0
local yaw = 0
if var2 == 35 then -- Jeep
	if scene_prop_slot_eq(button,orra_aircraft_pitch,0) == true then
		-- No key pressed: >>0<<
		pitch = 0
	elseif scene_prop_slot_eq(button,orra_aircraft_pitch,-1) == true then
		-- W: +
		pitch = 1
	elseif scene_prop_slot_eq(button,orra_aircraft_pitch,1) == true then
		-- S: -
		pitch = -1
	end
	if scene_prop_slot_eq(button,orra_aircraft_yaw,0) == true then
		-- No key pressed: Do nothing
		yaw = 0
	elseif scene_prop_slot_eq(button,orra_aircraft_yaw,-1) == true then
		-- Right: -1
		yaw = -1
	elseif scene_prop_slot_eq(button,orra_aircraft_yaw,1) == true then
		-- Left: 1
		yaw = 1
	end
	scene_prop_set_slot(button,orra_aircraft_pitch,0)
	scene_prop_set_slot(button,orra_aircraft_yaw,0)
end
return pitch, yaw
end

function interpret_input (object)
	local jerk = 0
	local yaw = 0
	
	-- Direct control
	if agent_is_active(object.driverId) == true then
		local player = agent_get_player_id(0,object.driverId)
		if player_is_active (player) == true then
		-- Up/Down
		if playerKeyPressed(player, "Up")
		or playerKeyPressed(player, "UpRight")
		or playerKeyPressed(player, "UpLeft")
		then jerk = 1
		elseif playerKeyPressed(player, "Down")
		or playerKeyPressed(player, "DownRight")
		or playerKeyPressed(player, "DownLeft")
		then jerk = -1
		else jerk = 0 end
		-- Left/Right
		if playerKeyPressed(player, "Left")
		or playerKeyPressed(player, "UpLeft")
		or playerKeyPressed(player, "DownLeft")
		then yaw = -1 
		elseif playerKeyPressed(player, "Right")
		or playerKeyPressed(player, "UpRight")
		or playerKeyPressed(player, "DownRight")
		then yaw = 1
		else yaw = 0 end
		end
	end
	
return jerk, yaw
end

function get_acceleration_curve (jerk,acceleration,acceleration_time,acceleration_curve,max_speed)--,reset_mode,damping_time,damping_curve
local speed = 0
local acceleration_min = -1
local acceleration_max = 1
	if jerk == 0 then if acceleration > 0 then jerk = -1 acceleration_min = 0 elseif acceleration < 0 then jerk = 1 acceleration_max = 0 end end
	--if jerk == 0 and reset_mode ~= nil and damping_time ~= nil and damping_curve ~= nil then
	--	local damping_jerk = 0
	--		if acceleration > 0 then damping_jerk = -1 elseif acceleration < 0 then damping_jerk = 1 end
	--	local acceleration_damping = math.abs(get_acceleration_curve (damping_jerk,acceleration,damping_time,damping_curve,max_speed))
	--end
	--acceleration_time = 20 -- 6 Seconds / 0.3 = 20
	--acceleration_curve = 0.6 --|0: Quick start <|1: Linear |>2: Slow start
	--max_speed = 900 -- 10 m/sec
acceleration = clamp((acceleration + (jerk / acceleration_time)),acceleration_min,acceleration_max)
	if acceleration < 0 then speed = max_speed * -(math.abs(acceleration)^acceleration_curve)
	else speed = max_speed * (acceleration^acceleration_curve) end
return speed, acceleration
end


--for root in g.propInstI(spr_empty) do

--var2 = prop_instance_get_variation_id_2(0,root)
--if var2 ~= (35 or 34) then goto stop end
--var1 = prop_instance_get_variation_id(0,root)
--if var1 ~= 100 then goto stop end

function jeep ()--(var2, root)
for root in g.propInstI(spr_empty) do

var2 = prop_instance_get_variation_id_2(0,root)
if var2 ~= (35 or 34) then goto stop end
var1 = prop_instance_get_variation_id(0,root)
if var1 ~= 100 then goto stop end
--
button = getPropSlot(root,orra_jeep_bigfoot_front_wheels)
--print(button)
-- Check if agent is still valid to control
button = getPropSlot(root,orra_control_button)
using_agent = getPropSlot(button,scene_prop_slot_controller_agent)
	if agent_is_active(using_agent) == true
		and agent_is_alive(using_agent) == true
		and agent_is_human(using_agent) == true
		and agent_is_non_player(using_agent) == false
		and agent_get_horse(0,using_agent) == -1 then
		--Check for distance to button
	elseif agent_is_active(using_agent) == true then
	call_script("set_agent_controlling_prop",button,using_agent,2)
	agent_set_animation(using_agent,anim_kneeling_end)
	end
-- Check if animation is needed
local animate = false
if (agent_is_active(using_agent) == true
and agent_is_non_player(using_agent) == false)
or (getPropSlot(root,orra_vehicle_acceleration)) ~= 0
or orra_vehicle_trigger_animation_conditions(var2,root) == true then animate = true
end if animate == false then goto stop end

-- Get control input from driver
input_up_down, input_left_right = orra_vehicle_trigger_get_control_input(var2,button,using_agent)

-- Get throttle
throttle = orra_vehicle_trigger_throttle_curve (var2,root,input_up_down)

-- Calculate physics and animate!
jeep1(root, throttle, (input_left_right * 12))





-- Get wheel turn
--yaw = orra_vehicle_trigger_throttle_curve (var2,root,input_left_right)
--]]
::stop::
end
end



function jeep1(root, thrust, difference_z)
--Get wheels and their radius (bigfoot or normal)
if scene_prop_slot_eq(root,orra_jeep_wheels_mode,orra_jeep_wheels_setting_bigfoot) == true then
rear_wheels = getPropSlot(root, orra_jeep_bigfoot_rear_wheels)
front_wheels = getPropSlot(root, orra_jeep_bigfoot_front_wheels)
wheel_radius = 163
else
rear_wheels = getPropSlot(root, orra_rear_wheels)
front_wheels = getPropSlot(root, orra_front_wheels)
wheel_radius = 78
end

--Get necessary positions
prop_instance_get_position(11,rear_wheels)
prop_instance_get_position(12,front_wheels)
init_position(15)-- pos15 - blank 000 pos
prop_instance_get_position(35,root)-- pos35 - root pos before wheel rays
Rear_Z = position_get_z(0,11)
Front_Z = position_get_z(0,12)

--TP props to prevent from obstacling wheels in aligning and casting rays
call_script("orra_animate_vehicle_to_pos",root,15,3)
--call_script("orra_compound_vehicle_toggle_physics",root,0,1)

--Gravitational bonus/penalty
X_Rot = position_get_rot_x(0,11)
grav_sin = sin(X_Rot)
if -0.120 <= grav_sin and grav_sin <= 0.120 then-- Too small SIN - don't bother to fix wiggling on one place
grav_sin = 0
end
thrust = thrust + (grav_sin/2.1739130434782608695652173913043)

--Drifting
RotateZ (11,(-difference_z * (thrust/441)))-- 441 - Max thrust w/no g

--Rear wheels: Move, Align, and handle Freefall
position_move_y(11,thrust)
position_align_to_ground(11,1,1)
Rear_Z_delta = position_get_z(0,11) - Rear_Z
if Rear_Z_delta < 0 then
times_in_free_fall = getPropSlot(rear_wheels,orra_vehicle_times_in_free_fall) + 1
scene_prop_set_slot(rear_wheels,orra_vehicle_times_in_free_fall,times_in_free_fall)
fall_speed = times_in_free_fall * -1000000 -- g/100 * 30 = 2.943 but i dont need it
Rear_Z_delta_clamped = (clamp(Rear_Z_delta,fall_speed,-1))
Rear_Z = Rear_Z + Rear_Z_delta_clamped
	if Rear_Z_delta_clamped == Rear_Z_delta then
	scene_prop_set_slot(rear_wheels,orra_vehicle_times_in_free_fall,0) end
position_set_z(11,Rear_Z)
else
scene_prop_set_slot(rear_wheels,orra_vehicle_times_in_free_fall,0)
end

--Rear wheels: Fix Z and X rot after Alignment
position_rotate_x(11,-90)
Z_Rot = getPropSlot(rear_wheels,orra_wheelbarrow_z_rot) + difference_z
scene_prop_set_slot(rear_wheels,orra_wheelbarrow_z_rot,Z_Rot)
RotateZ (11,(Z_Rot - position_get_RotateZ(0,11)))

--Pitch up if there's an obstacle between Front and Rear wheels
--WHEELS DISTANCE = 5.9360357129
position_move_z(11,100)
if cast_ray(0,12,11) == true then
ray_dist = g.preg[11].o:dist(g.preg[12].o)
position_move_z(11,-100)
	if ray_dist < 5.93 then    --ray_dist
	ray_acos = acos(ray_dist / 5.93)
	rot_x (11,ray_acos)
	end
else
position_move_z(11,-100)
end

--Front wheels: Offset from rear_wheels and fix strafing via ray
copy_position(12,11)
position_move_y(12,593)
position_move_z(12,200)
position_rotate_x(12,-90)
if cast_ray(unused,12,12) == true then --TRY FrontPos,FrontPos
position_copy_rotation(12,11)
else position_move_z(12,-200) position_rotate_x(12,90)-- Impossible scenario (?FW over abyss)
end

--VACANT SPACE FOR ROLL SMOOTHENING

--Put wheel edges on the ground
position_move_z(11,wheel_radius) position_move_z(12,wheel_radius)

--Front wheels: Handle freefall
Front_Z_delta = position_get_z(0,12) - Front_Z
if Front_Z_delta < 0 then
times_in_free_fall = getPropSlot(front_wheels,orra_vehicle_times_in_free_fall) + 1
scene_prop_set_slot(front_wheels,orra_vehicle_times_in_free_fall,times_in_free_fall)
fall_speed = times_in_free_fall * -1000000
Front_Z_delta_clamped = (clamp(Front_Z_delta,fall_speed,-1))
Front_Z = Front_Z + Front_Z_delta_clamped
	if Front_Z_delta_clamped == Front_Z_delta then
	scene_prop_set_slot(front_wheels,orra_vehicle_times_in_free_fall,0) end
position_set_z(12,Front_Z)
else
scene_prop_set_slot(front_wheels,orra_vehicle_times_in_free_fall,0)
end

--Hold 593 gap for front wheels; put root pos in middle
position_get_vector_to_position(0,12,11,12)
copy_position(50,12)
position_move_y(50,296)--296.5
position_move_y(12,593)
position_copy_rotation(12,11)
position_rotate_y(50,position_get_rot_y(0,12))

--Suspension
if scene_prop_slot_eq(root,orra_jeep_wheels_mode,orra_jeep_wheels_setting_bigfoot) == true then
X_Rot_after_landing = fix360(position_get_rot_x(0,11) - X_Rot)
last_sus_rot = getPropSlot(root,orra_jeep_suspension_x_rot)
sus_delta = X_Rot_after_landing - last_sus_rot
	if -2 <= sus_delta and sus_delta <= 2 then
	sus_delta = clamp(sus_delta,-1,1)
	else
	sus_delta = sus_delta / 2
	end
last_sus_rot = last_sus_rot + sus_delta
last_sus_rot = clamp(last_sus_rot,-10,10)
scene_prop_set_slot(root,orra_jeep_suspension_x_rot,last_sus_rot)
sus_z_weight = math.abs(last_sus_rot) * -1
position_move_z(50,sus_z_weight)
position_rotate_x(50,last_sus_rot)
end

--Animate wheels and root!
prop_instance_animate_to_position(front_wheels,12,29)
prop_instance_animate_to_position(rear_wheels,11,29)
call_script("orra_animate_vehicle_to_pos",root,35,3,0)
position_move_z(50,getPropSlot(root,orra_jeep_z_from_wheels_to_root))
call_script("orra_animate_vehicle_to_pos",root,50,1,29)

end