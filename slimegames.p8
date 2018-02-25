pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- slimegames
-- pico-8 edition

function _init ()
	cls()
	--< player positions >--
	size = 16
	-- p1 init
	p1 = {}
	p1.index = 0
	p1.xinit = 20
	p1.yinit = 80
	p1.x = p1.xinit
	p1.y = p1.yinit
	-- p2 init
	p2 = {}
	p2.index = 1
	p2.xinit = 90
	p2.yinit = 80
	p2.x = p2.xinit
	p2.y = p2.yinit
	
	--< global movement >--
	speed = 4
	jgravityinit = 0.1
	jspeedinit = 2
	
	--< player movement >--
	-- p1
	p1.jspeed = jspeedinit
	p1.jgravity = jgravityinit
	p1.jstate = false
	-- p2
	p2.jgravity = jgravityinit
	p2.jspeed = jspeedinit
	p2.jstate = false

	--< ball >--
	b = {}
	b.x = 27
	b.y = 50
	b.xspeed = 0
	b.yspeed = 0
	b.hitspeed = 2
	b.gravity = 0.019
	b.radius = 2
	b.color = 22
	b.timeout = false
	b.timelen = 60
	b.time = 100
end

function _update60()
	--< player 1 movement >--
	move(p1)
	jump(p1)
	
	--< player 2 movement >--
	move(p2)
	jump(p2)
	
	--< ball movement >--
	ball_move()
	ball_hit(p1)
	ball_hit(p2)
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
		p.jspeed -= p.jgravity
 	p.y -= p.jspeed
	else
		-- reset jump parameters
		p.jstate = false
		p.jspeed = jspeedinit
		p.jgravity = jgravityinit
		-- horrible fix for the
		-- occasional floor clip
		p.y = p.yinit + 0.01
	end
end

function ball_move()
	-- ball gravity
	b.yspeed += b.gravity
	-- ball movement
	b.y += b.yspeed
	b.x += b.xspeed
end

function ball_hit(p)
	p_center_x = p.x+size/2
	p_center_y = p.y+size-3
	-- ball distance from p1
	distance = (
		sqrt(
			(p_center_x-b.x)^2+
			(p_center_y-b.y)^2
		)
	)
	
	b.time += 1
	
	if b.timeout
				and b.time > b.timelen
				then
		b.timeout = false
	end
	
	-- if hit
	if distance<=size/2+b.radius
				and not b.timeout
				then
		p_hit(p_center_x,p_center_y)
		b.timeout = true
		b.time = 0
	end
end

function p_hit(px,py)
	b.angle = atan2(px-b.x,py-b.y)
	b.xspeed = -cos(b.angle)
	b.yspeed = -sin(b.angle)
end

function _draw()
 cls()
 map(0,0)
 -- p1 sprite
 sspr(
 	0,8,
 	size,size,
 	p1.x,p1.y
 )
 
 -- player 2 sprite
 sspr(
 	16,8,
 	size*2,size*2,
 	p2.x,p2.y
 )
	-- ball sprite
	circfill(
		b.x,b.y,b.radius,b.color
	)

	-- helpers
 pset(
 	p1.x+size/2,p1.y+size-3,2
 )
 circ(
 	p1.x+size/2,p1.y+size-3,size/2,14
 )
 line(
 	p1.x+size/2,p1.y+size-3,
 	b.x,b.y,
 	3
 )
 print(b.angle)
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
000008888880000000000cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0008888888888000000cccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008888887777880000cc7777cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08888888777088800ccc0777ccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08888888777788800ccc7777ccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
