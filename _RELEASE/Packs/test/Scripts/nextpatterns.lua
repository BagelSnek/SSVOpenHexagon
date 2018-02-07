u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("utils.lua")
u_execScript("alternativepatterns.lua")

function wallSAdj(mSide, mAdj) w_wallAdj(mSide, THICKNESS, mAdj) end
function wallSAcc(mSide, mAdj, mAcc, mMinSpd, mMaxSpd) w_wallAcc(mSide, THICKNESS, mAdj, mAcc * (u_getDifficultyMult()), mMinSpd, mMaxSpd) end

--pTrapBarrage: creates a ring of walls with a given side faster than the rest
function pTrapBarrage(mSide)
	delay = getPerfectDelayDM(THICKNESS) * 3.7
		
	cBarrage(mSide)
	t_wait(delay * 3)
	wallSAdj(mSide, 1.9)

	t_wait(delay * 2.5)
end

--pTrapBarrageDouble: creates a ring of walls with a given side and its opposite faster than the rest
function pTrapBarrageDouble(mSide)
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	side2 = mSide + getHalfSides();
	
	for i = 0, l_getSides() - 1 do
		currentSide = mSide + i
		if((currentSide ~= mSide) and (currentSide ~= side2)) then cWall(currentSide) end
	end

	t_wait(delay * 3)
	wallSAdj(mSide, 1.9)
	wallSAdj(side2, 1.9)
	
	t_wait(delay * 2.5)
end

--pTrapBarrageInverse: creates a ring of walls with a given side slower than the rest
function pTrapBarrageInverse(mSide)
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	
	cWall(mSide)	
	t_wait(delay * 3)

	for i = 0, l_getSides() - 1 do
		currentSide = mSide + i
		if(currentSide ~= mSide) then wallSAdj(currentSide, 1.9) end
	end

	t_wait(delay * 2.5)
end

--pTrapBarrageAlt: creates a ring where every second wall is faster
function pTrapBarrageAlt(mSide)
	delay = getPerfectDelayDM(THICKNESS) * 3.7

	for i = 0, l_getSides() - 1 do
		currentSide = mSide + i
		if(currentSide % 2 ~= 0) then cWall(currentSide) end
	end

	t_wait(delay * 3)

	for i = 0, l_getSides() - 1 do
		currentSide = mSide + i
		if(currentSide % 2 == 0) then wallSAdj(currentSide, 1.9) end
	end

	t_wait(delay * 2.5)
end

--pTrapSpiral: creates a spiral of half of the shape continually being rotated, starting on a given side
function pTrapSpiral(mSide)
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	loopDir = getRandomDir()		

	if(l_getSides() < 6) then delay = delay + 4 end

	for i = 0, l_getSides() + getHalfSides() do
		currentSide = (mSide + i) * loopDir
		for j = 0, getHalfSides() do wallSAdj(currentSide + j, 1.2 + (i / 7.9)) end
		t_wait((delay * 0.75) - (i * 0.45) + 3)
	end

	t_wait(delay * 2.5)
end

--pRCBarrage: creates rings with a random side open
function pRCBarrage()
	currentSides = l_getSides()
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	startSide = math.random(0, 10)
	for i = 0, currentSides - 2 do
		currentSide = startSide + i
		cWall(currentSide)
	end
	t_wait(delay * 2.5)
end

--pRCBarrageDouble: can't tell difference between pRCBarrage and pRCBarrageDouble
function pRCBarrageDouble()
	currentSides = l_getSides()
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	startSide = math.random(0, 10)
	for i = 0, currentSides - 2 do
		currentSide = startSide + i
		holeSide = startSide + i + (currentSides / 2)
		if(i ~= holeSide) then cWall(currentSide) end
	end
	t_wait(delay * 2.5)
end

--pRCBarrageSpin: creates 3 rings with a side missing from each, all next to each other
function pRCBarrageSpin()
	currentSides = l_getSides()
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	startSide = math.random(0, 10)
	loopDir = getRandomDir()
	for j = 0, 2 do
		for i = 0, currentSides - 2 do
			currentSide = startSide + i
			cWall(currentSide + (j * loopDir))
		end
		t_wait(delay + 1)
	end
	t_wait(delay * 2.5)
end

--pACBarrage: acceleradiant barrage thing
function pACBarrage()
	currentSides = l_getSides()
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	startSide = math.random(0, 10)
	for i = 0, currentSides - 2 do
		currentSide = startSide + i
		wallSAcc(currentSide, 9 + math.random(0, 1), -1.1, 1, 12)
	end
	t_wait(delay * 2.5)
end

--pACBarrageMulti: acceleradiant tunnel thing
function pACBarrageMulti()
	currentSides = l_getSides()
	delay = getPerfectDelayDM(THICKNESS) * 3.7
	startSide = math.random(0, 10)
	for i = 0, currentSides - 2 do
		currentSide = startSide + i
		wallSAcc(currentSide, 10, -1.09, 0.31, 10)
		wallSAcc(currentSide, 0, 0.05, 0, 4.0)
		wallSAcc(currentSide, 0, 0.09, 0, 4.0)
		wallSAcc(currentSide, 0, 0.12, 0, 4.0)
	end
	t_wait(delay * 8)
end

--pACBarrageMultiAltDir: acceleradiant spiral thing
function pACBarrageMultiAltDir()
	currentSides = l_getSides()
	delay = getPerfectDelayDM(THICKNESS) * 4
	mdiff = 1 + math.abs(1 - u_getDifficultyMult())
	startSide = math.random(0, 10)
	loopDir = getRandomDir()
	for i = 0, currentSides + getHalfSides() do
		currentSide = startSide + i * loopDir
		wallSAcc(currentSide, 10, -1.095, 0.40, 10)
		t_wait((delay / 2.21) * (mdiff * 1.29))
		wallSAcc(currentSide + (getHalfSides() * loopDir), 0, 0.128, 0, 1.4)
	end
	t_wait(delay * 8)
end