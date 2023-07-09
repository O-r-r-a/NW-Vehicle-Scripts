--[[
function getPositionRotationValue(pos, vectorName, field)
    game.reg[0] = math.floor(game.preg[pos].rot[vectorName][field] * 100000) -- добавляем рег чтоб можно было юзать из модульки
    return game.reg[0]
end

function orra_save_compound_entity (name,rootVar,minVar,maxVar)
game.set_fixed_point_multiplier(100000)
dicts[name] = dict_create()

local cur_slot = 0
for cur_part in g.propInstI() do
	kind = getPropKind(cur_part)
	if kind <= 0 then goto stop end
	var1 = getVar1(cur_part)
	if minVar > var1 or maxVar < var1 then goto stop end
	var2 = getVar2(cur_part)
	prop_instance_get_position(5,cur_part)
	local sx = getPositionRotationValue(5, "s", "x")
	local sy = getPositionRotationValue(5, "s", "y")
	local sz = getPositionRotationValue(5, "s", "z")
	local fx = getPositionRotationValue(5, "f", "x")
	local fy = getPositionRotationValue(5, "f", "y")
	local fz = getPositionRotationValue(5, "f", "z")
	local ux = getPositionRotationValue(5, "u", "x")
	local uy = getPositionRotationValue(5, "u", "y")
	local uz = getPositionRotationValue(5, "u", "z")
	local x = game.preg[5].o.x * 100000
	local y = game.preg[5].o.y * 100000
	local z = game.preg[5].o.z * 100000
	dict_set_int(dicts[name],"PosSX "..cur_slot,sx)
	dict_set_int(dicts[name],"PosSY "..cur_slot,sy)
	dict_set_int(dicts[name],"PosSZ "..cur_slot,sz)
	dict_set_int(dicts[name],"PosFX "..cur_slot,fx)
	dict_set_int(dicts[name],"PosFY "..cur_slot,fy)
	dict_set_int(dicts[name],"PosFZ "..cur_slot,fz)
	dict_set_int(dicts[name],"PosUX "..cur_slot,ux)
	dict_set_int(dicts[name],"PosUY "..cur_slot,uy)
	dict_set_int(dicts[name],"PosUZ "..cur_slot,uz)
	dict_set_int(dicts[name],"PosX "..cur_slot,x)
	dict_set_int(dicts[name],"PosY "..cur_slot,y)
	dict_set_int(dicts[name],"PosZ "..cur_slot,z)
	dict_set_int(dicts[name],"Kind "..cur_slot,kind)
	dict_set_int(dicts[name],"Var1 "..cur_slot,var1)
	dict_set_int(dicts[name],"Var2 "..cur_slot,var2)
	dict_set_pos(dicts[name],"Pos "..cur_slot,g.preg[5])
	prop_instance_get_scale(5, cur_part)
	scale_x = position_get_scale_x(0,5)
	scale_y = position_get_scale_y(0,5)
	scale_z = position_get_scale_z(0,5)
	dict_set_int(dicts[name],"ScaleX "..cur_slot,scale_x)
	dict_set_int(dicts[name],"ScaleY "..cur_slot,scale_y)
	dict_set_int(dicts[name],"ScaleZ "..cur_slot,scale_z)
		if var1 == rootVar then
		dict_set_int(dicts[name],"RootPropSlot ",cur_slot) end
	cur_slot = cur_slot + 1
::stop::
end

dict_set_int(dicts[name],"MaxEntitySlot",cur_slot - 1)
dict_set_str(dicts[name],"DictName",cur_slot.." props from "..minVar.." to "..maxVar..". Root "..rootVar)
dict_save_json(dicts[name],name)
dict_get_str(1,dicts[name],"DictName")
print("Saved "..game.sreg[1])
end

orra_save_compound_entity ("vehicle1",100,42,100)
--]]