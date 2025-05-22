local LightSwitch, super = Class(Event)

function LightSwitch:init(data)
	super.init(self, data)

	self:setSprite("world/events/"..(Mod:isLight() and "light" or "dark").."_switch1")
	self:setOrigin(0.5, 1)
end

function LightSwitch:onInteract()
	Game.world:startCutscene(function(cutscene)
		cutscene:text("* There's a comically-large light switch here.")
		cutscene:text("* Make the world "..(Mod:isLight() and "darker" or "lighter").."?")
		if cutscene:choicer({"Yes", "No"}) == 1 then
			self:setSprite("world/events/"..(Mod:isLight() and "light" or "dark").."_switch2")
			Assets.playSound("noise")
			cutscene:wait(1)

			Assets.playSound("revival")
			cutscene:wait(cutscene:fadeOut(1, {color=COLORS.white, blocky=true, global=true}))

			cutscene:wait(1.5)

			local followers_pos = {}
			for i,v in ipairs(Game.world.followers) do
				table.insert(followers_pos, {v.x, v.y, v.facing})
			end

			Mod:invertLight()
			cutscene:loadMap("stadium", Game.world.player.x, Game.world.player.y)

			for i,v in ipairs(followers_pos) do
				Game.world.followers[i]:setPosition(v[1], v[2])
				Game.world.followers[i]:setFacing(v[3])
			end
			cutscene:interpolateFollowers()

			cutscene:wait(cutscene:fadeIn(1, {color=COLORS.white, blocky=true, global=true}))

			cutscene:wait(1)
		else
			cutscene:text("* You "..(Mod:isLight() and "dark" or "light").."n't.")
		end
	end)
end

return LightSwitch