function Mod:init()
	print("Arrived in "..self.info.name.." !")
end

function Mod:onRegistered()
	Utils.hook(Registry, "createMap", function(orig, id, ...)
		local newId = id.."_"..Mod:getLightOrDarkString()
		if Registry.maps[newId] or Registry.map_data[newId] then
			return orig(newId, ...)
		end
		return orig(id, ...)
	end)
end

function Mod:isLight()
	if not Game then return false end
	if not Game.flags then
		return Game:isLight()
	end
	return Game:getFlag("dpt_light", false)
end

function Mod:invertLight()
	Game:setFlag("dpt_light", not Game:getFlag("dpt_light", false))
end

function Mod:getLightOrDarkString()
	return Mod:isLight() and "light" or "dark"
end