pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- slimegames
-- pico-8 edition

function _init ()
	cls()
	--< positions >--
	-- player 1
	p1xinit = 20
	p1yinit = 80
	p1x = p1xinit
	p1y = p1yinit
	-- player 2
	p2x = 80
	p2y = 80
	p2x = p2xinit
	p2y = p2yinit
	
	--< global movement >--
	speed = 4
	jgravityinit = 0.1
	jgravity = jgravityinit
	jspeedinit = 2
	
	--< player movement >--
	-- player 1
	p1jspeed = jspeedinit
	p2jstate = false
	-- player 2
	p2jspeed = jspeedinit
	p2jstate = false
	
	-- tests
	kek = 0
end

function _update60()
	--< player 1 controls >--
	move(0)
	jump(0)
	
	--< update tests >--
	kek += 1
end

function move(p)
	if btn(1,p) then
		p1x += 1
	end
	if btn(0,p) then
		p1x -= 1
	end
end

function jump(p)
	-- initiate jump
	if btn(2,p) and not p1jstate then
		p1jstate = true
 	p1y -= p1jspeed
	end
	
	-- produce jump motion
	if p1y < p1yinit then
		p1jstate = true
		p1jspeed -= jgravity
 	p1y -= p1jspeed
	else
		-- reset jump parameters
		p1jstate = false
		p1jspeed = jspeedinit
		p1jgravity = jgravityinit
		-- shi♥ fix for the
		-- occasional floor clip
		p1y = p1yinit + 0.01
	end
end

function _draw()
 cls()
 map(0,0)
 -- player 1 sprite
 sspr(0,8,16,16,p1x,p1y)
end

__gfx__
00000000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08888888777788800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08888888777088800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888777788880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888777788880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010102020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020206020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00080101378502b810288503c8502f8503f8502f8502f8503f850308601f8401e860308601e8603a8701d8701e870328701e8703387031860348702e870358701987019870208701c87000070378603786000000
00100000000000000019050190501a0501a0501a050000001a0501a050000001a0501a0500000019050190501a0501a050000001c0501c0501e05000000000000000000000000000000000000000000000000000
