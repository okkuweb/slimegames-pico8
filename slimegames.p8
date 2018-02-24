pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- slimegames
-- pico-8 edition

function _init ()
	cls()
	--< positions >--
	-- player 1
	p1 = {}
	p1.index = 0
	p1.xinit = 20
	p1.yinit = 80
	p1.x = p1.xinit
	p1.y = p1.yinit
	-- player 2
	p2 = {}
	p2.index = 1
	p2.xinit = 80
	p2.yinit = 80
	p2.x = p2.xinit
	p2.y = p2.yinit
	
	--< global movement >--
	speed = 4
	jgravityinit = 0.1
	jgravity = jgravityinit
	jspeedinit = 2
	
	--< player movement >--
	-- player 1
	p1.jspeed = jspeedinit
	p2.jstate = false
	-- player 2
	p2jspeed = jspeedinit
	p2jstate = false
	
	-- tests
	kek = 0
end

function _update60()
	--< player 1 controls >--
	move(p1)
	jump(p1)
	
	--< player 2 controls >--
	move(p2)
	jump(p2)
		
	--< update tests >--
	kek += 1
end

function move(p)
	if btn(1,p.index) then
		p.x += 1
	end
	if btn(0,p.index) then
		p.x -= 1
	end
end

function jump(p)
	-- initiate jump
	if btn(2,p.index) and not p.jstate then
		p.jstate = true
 	p.y -= p.jspeed
	end
	
	-- produce jump motion
	if p.y < p.yinit then
		p.jstate = true
		p.jspeed -= jgravity
 	p.y -= p.jspeed
	else
		-- reset jump parameters
		p.jstate = false
		p.jspeed = jspeedinit
		p.jgravity = jgravityinit
		-- shi♥ fix for the
		-- occasional floor clip
		p.y = p.yinit + 0.01
	end
end

function _draw()
 cls()
 map(0,0)
 -- player 1 sprite
 sspr(0,8,16,16,p1.x,p1.y)
 -- player 2 sprite
 sspr(16,8,32,32,p2.x,p2.y)
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
00008888888800000000cccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008888888888880000cccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08888888777788800ccc7777ccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08888888777088800ccc0777ccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888877778888cccc7777cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888877778888cccc7777cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888888888888cccccccccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888888888888cccccccccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888888888888cccccccccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888888888888cccccccccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
