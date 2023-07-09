local triggers = {}

function addTrigger(template2, interval, delay, delay_after, condition, func)

	
	local triggerId = -1
	if func == nil then
		triggerId = game.addTrigger(template2, interval, delay, delay_after, condition)
	else
		triggerId = game.addTrigger(template2, interval, delay, delay_after, condition, func)
	end
	table.insert(triggers, {template = template2, trigger = triggerId})
end

function deinitTriggers()
	for i = #triggers, 1, -1 do
		local v = triggers[i]
		game.removeTrigger(v.template, v.trigger)
	end
	triggers = {}
end

--print"DEINIT"
--deinitTriggers()