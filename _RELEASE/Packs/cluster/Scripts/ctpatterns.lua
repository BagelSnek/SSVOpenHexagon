u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

-- examplePattern: please make comments on what every function does in this format
function examplePattern(inputNonsense, doesntNeedAType)
	if inputNonsense == true then
		whateverYouWantItToDo()
	end
end

function spinning()
	side = getRandomSide()
	wallHMCurve(side, math.random(0.5, 1))
	wallHMCurve(side + 4, .7)
	wallHMCurve(side + 8, .7)
	wallHMCurve(side, -.7)
	wallHMCurve(side + 4, -.7)
	wallHMCurve(side + 8, -.7)
end

function wawl(mSide)
	swirl = mSide + 1
	blocc = mSide + 2
	w_wall(mSide, 4000)
	t_wait(15)
	for i = 0, 10 do
		cWall(blocc)
		blocc = blocc + 1
	end
	t_wait(10)
	for i = 0, 4 do
		for i = 0, 7 do
			cWall(mSide + swirl)
			cWall(mSide + swirl + 5)
			t_wait(5)
			swirl = swirl + 1
		end
		
		for i = 0, 6 do
			cWall(mSide + swirl)
			cWall(mSide + swirl + 5)
			t_wait(5)
			swirl = swirl - 1
		end
	end
end

function spinTrap(mSide)
	side = mSide
	cWallEx(side, 4)
	cWallEx(side + 8, 3)
	wallHMCurve(side, 2.5)
	wallHMCurve(side, -2.5)
end

function confuse(mSide)
	woah = 0.1
	inc = 0.3
	for i = 0, 20 do
		wallHMCurve(mSide, woah)
		woah = woah + inc
		inc = inc + 0.015 --.02 is too fast
		t_wait(6)
	end
end

function confuseS(mSide)
	woah = 1.1
	inc = 0.01
	timeWoah = 4.0
	inc2 = 0.4
	for i = 0, 28 do
		wallSAcc(mSide, 1, 1, 1, woah)
		woah = woah - inc
		mSide = mSide + 1
		timeWoah = timeWoah - inc2
		t_wait(timeWoah)
	end
	t_wait(100)
end

function trap()
	side = getRandomSide()
	wallSAcc(side, 1, 1, 1, 1.2)
	t_wait(60)
	wallSAcc(side + 1, 1, 1, 1, 3)
	wallSAcc(side + 2, 1, 1, 1, 3)
	wallSAcc(side + 3, 1, 1, 1, 3)
	wallSAcc(side + 4, 1, 1, 1, 3)
	wallSAcc(side + 5, 1, 1, 1, 3)
	wallSAcc(side + 6, 1, 1, 1, 3)
	wallSAcc(side + 7, 1, 1, 1, 3)
	wallSAcc(side + 8, 1, 1, 1, 3)
end

function hintTrap(mSide)
	side = mSide
	wallSAcc(side, 1, 1, 1, 1.2)
	wallSAcc(side - 1, 1, 1, 1, 1.2)
	wallSAcc(side - 2, 1, 1, 1, 1.2)
	wallSAcc(side - 3, 1, 1, 1, 1.2)
	wallSAcc(side + 1, 1, 1, 1, 1.2)
	wallSAcc(side + 2, 1, 1, 1, 1.2)
	wallSAcc(side + 3, 1, 1, 1, 1.2)
	t_wait(10)
	wallHMCurve(side, 10)
	wallHMCurve(side, -10)
	t_wait(20)
end

function holyHeck(times)
	for i = 0, times do
		side = getRandomSide()
		curve = math.random(-7,7)
		curveAcc = math.random(-0.2, 0.2)
		curveMin = math.random(-3, -1)
		curveMax = math.random(1, 7)
		wallHMCurveAcc(side, curve, curveAcc, curveMin, curveMax, true)
		wallHMCurveAcc(side + 1, curve, curveAcc, curveMin, curveMax, true)
		wallHMCurveAcc(side, curve, curveAcc, curveMax * -1, curveMin * -1, true)
		wallHMCurveAcc(side + 1, curve, curveAcc, curveMax * -1, curveMin * -1, true)
		t_wait(30)
	end
end

function straightSpiral(times)
	side = getRandomSide()
	curveAcc = 0.1
	for i = 0, times do
		wallHMCurveAcc(side, -4.0, curveAcc, -9, 2, true)
		wallHMCurveAcc(side + 3, -4.0, curveAcc, -9, 2, true)
		wallHMCurveAcc(side + 6, -4.0, curveAcc, -9, 2, true)
		curveAcc = curveAcc + 0.01
		t_wait(7)
	end
	t_wait(times)
end

function colorSpiral(spin)
	side = getRandomSide()
	for i = 0, 20 do
		wallHMCurve(side, 10 + spin)
		wallHMCurve(side + 3, 10 + spin)
		side = side + 1
		t_wait(8)
	end
end

function colorWobbly(times)
	side = getRandomSide()
	for i = 0, times do
		wallHMCurveAcc(side, 10, 0.5, 1, 9, true)
		wallHMCurveAcc(side + 3, 10, 0.5, 1, 9, true)
		side = side + 1
		t_wait(6)
	end
	t_wait(times)
end

function colorSpiralAcc(spin)
	side = getRandomSide()
	spinning = spin / 2
	--m_messageAddImportant("Accelerate your right-key pressing", 100)
	for i = 0, 30 do
		wallHMCurve(side, 10 + spinning)
		wallHMCurve(side + 3, 10 + spinning)
		side = side + 1
		spinning = spinning - (spin / 4)
		t_wait(8)
	end
end

function colorSomeWalls()
	side = getRandomSide()
	wallHMCurve(side, 10)
	wallHMCurve(side + 3, 10)
	t_wait(5)
end

function colorSomeRandoWalls()
	side = getRandomSide()
	wallHMCurve(side, math.random(9.7, 10.7))
	wallHMCurve(side + 3, math.random(9.7, 10.7))
	t_wait(5)
end

function lotsOWalls(num)
	for i = 0, num do
		cWall(getRandomSide())
	end
end

function spoopySpin()
	side = getRandomSide()
	tim = 1
	for i = 0, 400 do
		if math.random(0, 2) == 0 then
			side = side - 1
			rWall(side)
		else
			side = side + 1
			rWall(side)
		end
		t_wait(tim)
	end
end

function spoopyFlower()
	for i = 0, 10 do
		side = getRandomSide()
		w_wall(side, 1600)
		w_wall(side + 1, 1400)
		w_wall(side - 1, 1400)
		w_wall(side + 18, 1800)
		cWall(side + 19)
		cWall(side + 17)
		t_wait(110)
		move = 3
		for i = 0, 30 do
			wallSAcc(side + move, 1, 1, 1, 3)
			wallSAcc(side + move, 1, 1, 1, 2.5)
			wallSAcc(side + move, 1, 1, 1, 2)
			move = move + 1
			t_wait(0.1)
		end
	end
end

function spoopySlowing()
	for i = 0, 16 do
		side = getRandomSide()
		side2 = getRandomSide()
		side3 = getRandomSide()
		side4 = getRandomSide()
		side5 = getRandomSide()
		side6 = getRandomSide()
		side7 = getRandomSide()
		side8 = getRandomSide()
		side9 = getRandomSide()
		side10 = getRandomSide()
		side11 = getRandomSide()
		side12 = getRandomSide()
		side13 = getRandomSide()
		side14 = getRandomSide()
		side15 = getRandomSide()
		side16 = getRandomSide()
		side17 = getRandomSide()
		side18 = getRandomSide()
		woosh = 1
		wooshing = 0.1
		for j = 0, 15 do
			wallSAcc(side, 1, 1, 1, woosh)
			wallSAcc(side2, 1, 1, 1, woosh)
			wallSAcc(side3, 1, 1, 1, woosh)
			wallSAcc(side4, 1, 1, 1, woosh)
			wallSAcc(side5, 1, 1, 1, woosh)
			wallSAcc(side6, 1, 1, 1, woosh)
			wallSAcc(side7, 1, 1, 1, woosh)
			wallSAcc(side8, 1, 1, 1, woosh)
			wallSAcc(side9, 1, 1, 1, woosh)
			wallSAcc(side10, 1, 1, 1, woosh)
			wallSAcc(side11, 1, 1, 1, woosh)
			wallSAcc(side12, 1, 1, 1, woosh)
			wallSAcc(side13, 1, 1, 1, woosh)
			wallSAcc(side14, 1, 1, 1, woosh)
			wallSAcc(side15, 1, 1, 1, woosh)
			wallSAcc(side16, 1, 1, 1, woosh)
			wallSAcc(side17, 1, 1, 1, woosh)
			wallSAcc(side18, 1, 1, 1, woosh)
			woosh = woosh + wooshing
			wooshing = wooshing + 0.05
			t_wait(7)
		end
		sided = 18
		t_wait(1)
	end
	t_wait(20)
end

function spoopyWobble(times)
	side = getRandomSide()
	for i = 0, times do
		rWall(side)
		rWall(side + 9)
		r = math.random(0, 2)
		if r == 0 then side = side + 1
		elseif r == 2 then side = side - 1
		end
		t_wait(6)
	end
end

function BPWobble(times)
	side = getRandomSide()
	for i = 0, times do
		cWall(side)
		cWall(side + 9)
		--cWall(side + 12)
		r = math.random(0, 3)
		if r == 0 then side = side - 2 end
		if r == 1 then side = side - 1 end
		side = side + 1
		t_wait(2)
	end
end

function BPBubble()
	side = getRandomSide()
	for i = 0, math.random(10, 16) do
		cWall(side)
		cWall(side - 1)
		cWall(side + 1)
		cWall(side - 2)
		cWall(side + 2)
		t_wait(4)
		cWall(side - 2)
		cWall(side + 2)
		t_wait(4)
		cWall(side)
		cWall(side - 1)
		cWall(side + 1)
		cWall(side - 2)
		cWall(side + 2)
		side = getRandomSide()
		--t_wait(10)
	end
	t_wait(20)
end

function bwRando(mTimes)
	for i = 0, mTimes * 10 do
		cWall(getRandomSide())
		t_wait(7)
		wallHMCurve(getRandomSide(), math.random(-1, 1))
		t_wait(7)
	end
end

function bwBlocc(mTimes)
	side2 = 0
	for i = 0, mTimes do
		side = getRandomSide()
		if side == side2 then side = getRandomSide() end
		wallSAcc(side + 1, 1, 1, 1, 1.5)
		wallSAcc(side + 2, 1, 1, 1, 2)
		cWall(side)
		t_wait(50)
		side2 = side
	end
end