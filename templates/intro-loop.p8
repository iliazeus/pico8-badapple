pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--bad apple, but...

function draw32(s)
	local bits = {}
	for i = 1, #s do
		local v = 0
		local c = ord(s, i)
		if 97<=c and c<=122 then
			v = c - 97
		elseif 50<=c and c<=55 then
			v = c - 24
		else break end
		for p = 4, 0, -1 do
			add(bits, (v & (1<<p)) >> p)
		end
	end
	
	local ibit = 1
	function next_bit()
		local b = bits[ibit]
		ibit += 1
		return b
	end
	
	function rec(x0,y0,n)
		if next_bit() == 1 then
			rec(x0,y0,n/2)
			rec(x0+n/2,y0,n/2)
			rec(x0,y0+n/2,n/2)
			rec(x0+n/2,y0+n/2,n/2)
		else
			if next_bit() == 1 then
				color(7)
			else
				color(0)
			end
			rectfill(x0,y0,x0+n-1,y0+n-1)
			--debug wireframe
			--if n >= 4 then
			--	rect(x0,y0,x0+n-1,y0+n-1,11)
			--end
		end
	end
	
	cls()
	rec(0,0,128)
end
-->8
--[[frames]]--
-->8
iframe = 1
tframe = 0

function _init()
	cls()
	music(0)
end

function _update()
	tframe += 1
	while tframe >= framestep do
		tframe -= framestep
		iframe += 1
		if iframe > #frames then
			iframe = loopstartframe
		end
	end
	draw32(frames[iframe])
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777700000007777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777700000000000777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777770000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777770000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777700000000000077777000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777700000000000000007700000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777000000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777770000000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777770000000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777000000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777000000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777700000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777700000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777770000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777770000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777000000000000000000000000000000000007000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777700000000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777700000000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777770000000000000000000000000000000000077777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777000000000000000000000000000000000007777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777700000000000000000000000000000000000777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777700000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777700000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777700000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000000000777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777000000000000000000000000000007777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000007777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000007777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000007777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000007000000000000000000007777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000077777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000007777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777770000000000000000000000000000000777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777700000000000000000000000000000000077777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777700000000000000000000000000000000007777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777000000000000000000000000000000000000777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777770000000000000000000000000000000000000777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777700000000000000000000000000000000000000777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777700000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777770000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777700000000000000000000000000000000000000000077777777777777777777777777777777777777777777
77777777777777777777777777777777777777777700000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777000000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777777000000000000000000000000000000000000000000007777777777777777777777777777777777777777777
77777777777777777777777777777777777777770000000000000000000000000000000000000000000000000777777777777777777777777777777777777777
77777777777777777777777777777777777777770000000000000000000000000000000000000000000000000777777777777777777777777777777777777777
77777777777777777777777777777777777777700000000000000000000000000000000000000000000000000777777777777777777777777777777777777777
77777777777777777777777777777777777777700000000000000000000000000000000000000000000000007777777777777777777777777777777777777777
77777777777777777777777777777777777777700000000000000000000000000000000000000000000000007777777777777777777777777777777777777777
77777777777777777777777777777777777777000000700000000000000000000000000000000000000000007777777777777777777777777777777777777777
77777777777777777777777777777777777777000000770000000000000000000000000000000000000000000777777777777777777777777777777777777777
77777777777777777777777777777777777777000007770000000000000000000000000000000000000000000777777777777777777777777777777777777777
77777777777777777777777777777777777777000007770000000000000000000000000000000000000000000777777777777777777777777777777777777777
77777777777777777777777777777777777770000007700000000007000000000000000000000000000000000077777777777777777777777777777777777777
77777777777777777777777777777777777770000007700000000007000000000000000000000000000000000077777777777777777777777777777777777777
77777777777777777777777777777777777770000077700000000007700000000000000000000000000000000077777777777777777777777777777777777777
77777777777777777777777777777777777770000077700000000007700000000000000000000000000000000007777777777777777777777777777777777777
77777777777777777777777777777777777770000077700000000007700000000000000000000000000000000007777777777777777777777777777777777777
77777777777777777777777777777777777700000077700000000007700000000000000000000000000000000007777777777777777777777777777777777777
77777777777777777777777777777777777700000077000000000007700000000000000000000000000000000000777777777777777777777777777777777777
77777777777777777777777777777777777700000077000000000007700000000000000000000000000000000000777777777777777777777777777777777777
77777777777777777777777777777777777700000070000000000007700000000000000000000000000000000000077777777777777777777777777777777777
77777777777777777777777777777777777700000070000000000007700000000000000000000000000000000000077777777777777777777777777777777777
77777777777777777777777777777777777700000000000000000007700000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777700000000000000000007700000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777700000000000000000007700000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777700000000000000000007700000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777700000000000000000007700000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777700000000000000000007700000000000000000000000000000000000000077777777777777777777777777777777
77777777777777777777777777777777777700000000000000000077700000000000000000000000000000000000000077777777777777777777777777777777
77777777777777777777777777777777777700000000000000000077700000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777700000000000000000077700000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777700000000000000000077700000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777700000000000000000077000000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777700000000000000000077000000000000000000000000000000000000000000077777777777777777777777777777
77777777777777777777777777777777777700000000000000000077000000000000000000000000000000000000000000077777777777777777777777777777
77777777777777777777777777777777777700000000000000000770000000000000000000000000000000000000000000077777777777777777777777777777
77777777777777777777777777777777777770000000000000000770000000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777777000000000000000770000000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777770000000000000000700000000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777770000000000000007700000000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777770000000000000007700000000000000000000000000000000000000000000777777777777777777777777777777
77777777777777777777777777777777777770000000000000007700000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777770000000000000007000000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777770000000000000077000000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777770000000000000077000000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777770000000000000077000000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777777000000000000770000000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777777700000000000770000000000000000000000000000000000000000000007777777777777777777777777777777
77777777777777777777777777777777777777000000000007770000000000000000000000000000000000000000000077777777777777777777777777777777
77777777777777777777777777777777777777000000000007700000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777777000000000077700000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777777000000000077000000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777770000000000777000000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777770000000000770000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777770000000007770000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777770000000077700000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777770000000077700000000000000000000000000000000000000000000077777777777777777777777777777777777
77777777777777777777777777777777777770000000777000000000000000000000000000000000000000000000077777777777777777777777777777777777
77777777777777777777777777777777777770000007777000000000000000000000000000000000000000000000077777777777777777777777777777777777
77777777777777777777777777777777777770000007770000000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777770000077770000000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777777000777700000000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777777700777700000000000000000000000000000000000000000000000007777777777777777777777777777777777
77777777777777777777777777777777777777770777000000000000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777777777777000000000000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777777777770000000000000000000000000000000000000000000000000000777777777777777777777777777777777
77777777777777777777777777777777777777777770000000000000000000000000000000000000000000000000000777777777777777777777777777777777

__sfx__
010600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010d002000173001003c6150010000173001003c6150000000173000003c615000000017300173001730017300173000003c6150000000173000003c6150000000173000003c6150000000173000000017300000
__music__
00 00424344
03 01424344

