function Mod:init()
	print("Arrived in "..self.info.name.." !")
end

function Mod:postInit()
	Utils.hook(World, "loadMap", function(orig, self, map, ...)
		--local world_mode = Mod:isLight() and "light" or "dark"
		--local new_id = id.."_"..world_mode
		--if self.maps[id.."_"..world_mode] or self.map_data

		print(map)

		if (isClass(map) or type(map) == "table") and map.id == "stadium" then
			orig(self, map.id.."_"..(Mod:isLight() and "light" or "dark"), ...)
		elseif type(map) == "string" and map == "stadium" then
			orig(self, map.."_"..(Mod:isLight() and "light" or "dark"), ...)
		else
			orig(self, map, ...)
		end
	end)

	Utils.hook(World, "setupMap", function(orig, self, map, ...)
	    for _,child in ipairs(self.children) do
	        if not child.persistent then
	            self:removeChild(child)
	        end
	    end
	    for _,child in ipairs(self.controller_parent.children) do
	        if not child.persistent then
	            self.controller_parent:removeChild(child)
	        end
	    end

	    self:updateChildList()

	    self.healthbar = nil
	    self.followers = {}

	    self.camera:resetModifiers(true)
	    self.camera:setAttached(true)

	    if isClass(map) then
	        self.map = map
	    elseif type(map) == "string" then
	        self.map = Registry.createMap(map, self, ...)
	    elseif type(map) == "table" then
	        self.map = Map(self, map, ...)
	    else
	        self.map = Map(self, nil, ...)
	    end

	    self.map.light = Mod:isLight()

	    self.map:load()

	    local dark_transitioned = self.map.light ~= Game:isLight()

	    Game:setLight(self.map.light)

	    self.width = self.map.width * self.map.tile_width
	    self.height = self.map.height * self.map.tile_height

	    --self.camera:setBounds(0, 0, self.map.width * self.map.tile_width, self.map.height * self.map.tile_height)

	    self.battle_fader = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
	    self.battle_fader:setParallax(0, 0)
	    self.battle_fader:setColor(0, 0, 0)
	    self.battle_fader.alpha = 0
	    self.battle_fader.layer = self.map.battle_fader_layer
	    self.battle_fader.debug_select = false
	    self:addChild(self.battle_fader)

	    self.in_battle = false
	    self.in_battle_area = false
	    self.battle_alpha = 0

	    local map_border = self.map:getBorder(dark_transitioned)
	    if map_border then
	        Game:setBorder(Kristal.callEvent(KRISTAL_EVENT.onMapBorder, self.map, map_border) or map_border)
	    end

	    if not self.map.keep_music then
	        self:transitionMusic(Kristal.callEvent(KRISTAL_EVENT.onMapMusic, self.map, self.map.music) or self.map.music)
	    end
	end)
end

function Mod:isLight()
	if not Game or not Game.flags then return false end
	return Game:getFlag("dpt_light", false)
end

function Mod:invertLight()
	local function sayDark(bool)
		return bool and "light" or "dark"
	end
	print("The opposite of "..sayDark(Game:getFlag("dpt_light", false)).." is "..sayDark(not Game:getFlag("dpt_light", false)))
	Game:setFlag("dpt_light", not Game:getFlag("dpt_light", false))
end