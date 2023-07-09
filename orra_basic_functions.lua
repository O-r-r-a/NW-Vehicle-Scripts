g = game
prop_instance_is_valid = game.prop_instance_is_valid
init_position = game.init_position
prop_instance_get_position = game.prop_instance_get_position
prop_instance_set_position = game.prop_instance_set_position
position_transform_position_to_local = game.position_transform_position_to_local
position_transform_position_to_parent = game.position_transform_position_to_parent
dict_create = game.dict_create
dict_set_pos = game.dict_set_pos
dict_get_pos = game.dict_get_pos
dict_set_int = game.dict_set_int
dict_get_int = game.dict_get_int
dict_set_str = game.dict_set_str
dict_get_str = game.dict_get_str
dict_save_json = g.dict_save_json
dict_save = g.dict_save
dict_load_file_json = g.dict_load_file_json
dict_erase = game.dict_erase
dict_free = game.dict_free
position_get_x = game.position_get_x
position_get_y = game.position_get_y
position_get_z = game.position_get_z
position_move_x = game.position_move_x
position_move_y = game.position_move_y
position_move_z = game.position_move_z
position_rotate_x = game.position_rotate_x
position_rotate_y = game.position_rotate_y
position_rotate_z = game.position_rotate_z
position_rotate_x_floating = game.position_rotate_x_floating
position_rotate_y_floating = game.position_rotate_y_floating
position_rotate_z_floating = game.position_rotate_z_floating
position_get_scale_x = g.position_get_scale_x
position_get_scale_y = g.position_get_scale_y
position_get_scale_z = g.position_get_scale_z
prop_instance_get_scale = g.prop_instance_get_scale
prop_instance_get_animation_target_position = game.prop_instance_get_animation_target_position
position_get_rot_x = game.position_get_rotation_around_x
position_get_rot_y = game.position_get_rotation_around_y
position_get_rot_z = game.position_get_rotation_around_z
position_set_x = game.position_set_x
position_set_y = game.position_set_y
position_set_z = game.position_set_z
position_copy_rotation = game.position_copy_rotation
position_copy_origin = game.position_copy_origin
scene_prop_slot_eq = game.scene_prop_slot_eq
scene_prop_get_slot = game.scene_prop_get_slot
assign = game.assign
set_fixed_point_multiplier = game.set_fixed_point_multiplier
position_align_to_ground = game.position_align_to_ground
get_distance_between_positions = game.get_distance_between_positions
copy_position = game.copy_position
particle_system_burst = game.particle_system_burst
position_get_vector_to_position = game.position_get_vector_to_position
cast_ray = game.cast_ray
prop_instance_animate_to_position = game.prop_instance_animate_to_position
display_message = game.display_message
scene_prop_set_slot = game.scene_prop_set_slot
prop_instance_get_variation_id = game.prop_instance_get_variation_id
prop_instance_get_variation_id_2 = game.prop_instance_get_variation_id_2
agent_is_active = game.agent_is_active
agent_is_human = game.agent_is_human
agent_is_non_player = game.agent_is_non_player
agent_get_horse = game.agent_get_horse
agent_is_alive = game.agent_is_alive
agent_set_animation = game.agent_set_animation
agent_set_position = g.agent_set_position
agent_get_player_id = g.agent_get_player_id
player_is_active = g.player_is_active

function TurnMissionScriptsOn()
 game.reg[10] = 150
end

dofile("orra_constants.lua")
dofile("orra_scene_props.lua")


dicts = {}

gamemodes = {"mst_multiplayer_dm",
"mst_multiplayer_tdm",
"mst_multiplayer_hq",
"mst_multiplayer_cf",
"mst_multiplayer_sg",
"mst_multiplayer_bt",
"mst_multiplayer_cb",
"mst_multiplayer_duel",
"mst_multiplayer_kh",
"mst_multiplayer_br",
"mst_multiplayer_cm"
}


--local deg, rad = math.deg, math.rad
sin = function (x) return math.sin(math.rad(x)) end
asin = function (x) return math.deg(math.asin(x)) end
cos = function (x) return math.cos(math.rad(x)) end
acos = function (x) return math.deg(math.acos(x)) end
function clamp(val, lower, upper)
    assert(val and lower and upper, "not very useful error message here")
    if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way
    return math.max(lower, math.min(upper, val))
end

c = game.call_script
function call_script(...) 
	local ids = {}
	local args = {...}
	
	local id = ids[args[1]]
	if id == nil then 
		ids[args[1]] = game.getScriptNo(args[1]) 
		id = ids[args[1]]
	end
	
	c(id, unpack(args, 2, #args))
end

-- Dumb ass fucking mission template thingy for adding triggers without BS
function addTriggerBS(interval, delay, delay_after, condition, func)
	for i, value in ipairs(gamemodes) do
		addTrigger(value, interval, delay, delay_after, condition, func)
	end
end
-- BS End!

-- Global Variables Start
--local variables = {}
function setGlobalVariable(id, value)
	--print("INCOMING ID: "..id.." AAAAAND VALUE: "..value)
	_G[id] = value
end
function getGlobalVariable(id)
	if _G[id] == nil then return 0 end
	return _G[id]
end
set_ = setGlobalVariable
_ = getGlobalVariable
-- Global Variables End

function getTriggerParam(index)
  return g.store_trigger_param(0, index)
end
function getScriptParam(index)
  return g.store_script_param(0, index)
end
function getVar1(index)
  return game.prop_instance_get_variation_id(0, index)
end
function getVar2(index)
  return game.prop_instance_get_variation_id_2(0, index)
end
function getPropSlot(prop, slot)
  return g.scene_prop_get_slot(0, prop, slot)
end
function getPropKind(index)
  return g.prop_instance_get_scene_prop_kind(0, index)
end
function RotateX (pos, value)
	local p = game.preg[pos] p:rotX(value) game.preg[pos] = p
end
function RotateY(pos, value)
	local p = game.preg[pos] p:rotY(value) game.preg[pos] = p
end
function RotateZ (pos, value)
	local p = game.preg[pos] p:rotZ(value) game.preg[pos] = p
end
function fix360 (angle)
	if angle > 180 then return angle - 360
	elseif angle < -180 then return angle + 360 
	else return angle end
end



--[[
function getfield (f)
local t = _G -- start with the table of globals
local v = nil
for w, d in string.gfind(f, "([%w_]+)(.?)") do
if d == "." then -- not last field?
t[w] = t[w] or {} -- create table if absent
t = t[w] -- get the table
else -- last field
v = t[w] -- do the assignment
end
end
return v;
end

function c(str)
  local varname = "game.const.test."..str
  return (getfield("game.const.test."..str))
end
--]]