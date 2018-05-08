u_execScript("common.lua")

-- pAltBarrage: spawns a series of cAltBarrage
function pAltBarrage(mTimes, mStep)
	delay = getPerfectDelayDM(THICKNESS) * 5.6
	
	for i = 0, mTimes do
		cAltBarrage(i, mStep)
		t_wait(delay)
	end
	
	t_wait(delay)
end

-- pMirrorSpiral: spawns a spiral of rWallEx
function pMirrorSpiral(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS)
	startSide = getRandomSide()
	loopDir = getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
		j = j + loopDir
		t_wait(delay)
	end
	
	THICKNESS = oldThickness
	
	t_wait(getPerfectDelayDM(THICKNESS) * 6.5)
end

-- pMirrorSpiralDouble: spawns a spiral of rWallEx where you need to change direction
function pMirrorSpiralDouble(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelayDM(THICKNESS)
	startSide = getRandomSide()
	currentSide = startSide
	loopDir = getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
		j = j + loopDir
		t_wait(delay)
	end
	
	rWallEx(startSide + j, mExtra)
	t_wait(delay * 0.9)
	
	rWallEx(startSide + j, mExtra)
	t_wait(delay * 0.9)
	
	loopDir = loopDir * -1
	
	for i = 0, mTimes + 1 do
		currentSide = currentSide + loopDir;
		rWallEx(currentSide + j - 1, mExtra)
		j = j + loopDir
		t_wait(delay)
	end
	
	THICKNESS = oldThickness
	t_wait(getPerfectDelayDM(THICKNESS) * 7.5)
end

-- pBarrageSpiral: spawns a spiral of cBarrage
function pBarrageSpiral(mTimes, mDelayMult, mStep)
	delay = getPerfectDelayDM(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	loopDir = mStep * getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		cBarrage(startSide + j)
		j = j + loopDir
		t_wait(delay)
		if(l_getSides() < 6) then t_wait(delay * 0.6) end
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
end

-- pDMBarrageSpiral: spawns a spiral of cBarrage, with static delay
function pDMBarrageSpiral(mTimes, mDelayMult, mStep)
	delay = (getPerfectDelayDM(THICKNESS) * 5.42) * (mDelayMult / (u_getDifficultyMult() ^ 0.4)) * (u_getSpeedMultDM() ^ 0.35)
	startSide = getRandomSide()
	loopDir = mStep * getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		cBarrage(startSide + j)
		j = j + loopDir
		t_wait(delay)
		if(l_getSides() < 6) then t_wait(delay * 0.49) end
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * (6.7 * (u_getDifficultyMult() ^ 0.7)))
end

-- pWallExVortex: spawns left-left right-right spiral patters
function pWallExVortex(mTimes, mStep, mExtraMult)
	delay = getPerfectDelayDM(THICKNESS) * 5.0 
	startSide = getRandomSide()
	loopDir = getRandomDir()
	currentSide = startSide
	
	for j = 0, mTimes do
		for i = 0, mStep do
			currentSide = currentSide + loopDir
			rWallEx(currentSide, loopDir * mExtraMult)
			t_wait(delay)
		end
		
		loopDir = loopDir * -1
		
		for i = 0, mStep + 1 do
			currentSide = currentSide + loopDir;
			rWallEx(currentSide, loopDir * mExtraMult)
			t_wait(delay)
		end
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 5.5)
end

-- pInverseBarrage: spawns two barrages who force you to turn 180 degrees
function pInverseBarrage(mTimes)
	delay = getPerfectDelayDM(THICKNESS) * 9.9
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cBarrage(startSide)
		t_wait(delay)
		if(l_getSides() < 6) then t_wait(delay * 0.8) end
		cBarrage(startSide + getHalfSides())
		t_wait(delay)
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 2.5)
end

-- pRandomBarrage: spawns barrages with random side, and waits humanly-possible times depending on the sides distance
function pRandomBarrage(mTimes, mDelayMult)
	side = getRandomSide()
	oldSide = 0
	
	for i = 0, mTimes do	
		cBarrage(side)
		oldSide = side
		side = getRandomSide()
		t_wait(getPerfectDelayDM(THICKNESS) * (2 + (getSideDistance(side, oldSide)*mDelayMult)))
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 5.6)
end

-- pMirrorWallStrip: spawns rWalls close to one another on the same side
function pMirrorWallStrip(mTimes, mExtra)
	delay = getPerfectDelayDM(THICKNESS) * 3.65
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		rWallEx(startSide, mExtra)
		t_wait(delay)
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 5.00)
end

-- pTunnel: forces you to circle around a very thick wall
function pTunnel(mTimes)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			w_wall(startSide, myThickness + 5 * u_getSpeedMultDM() * delay)
		end
		
		cBarrage(startSide + loopDir)
		t_wait(delay)
		
		loopDir = loopDir * -1
	end
	
	THICKNESS = oldThickness
end

function wallRound(mSide)
	dasSide = 0
	interval = 1
	waitTime = 7
	for i = 0, 30 do
		rWall(dasSide, 20)
		dasSide = dasSide + interval
		t_wait(waitTime)
		waitTime = waitTime - 0.1
		if waitTime < 6.2 then interval = -1 end
		if waitTime < 5 then interval = 1 end
	end
end

function lazar(mSide)
	side = mSide
	w_wall(mSide, 7000)
	w_wall(mSide + 3, 7000)
	w_wall(mSide + 6, 7000)
	for i = 0, 3 do
		cWall(mSide + 1)
		cWall(mSide + 4)
		cWall(mSide + 7)
		t_wait(20)
		cWall(mSide + 2)
		cWall(mSide + 5)
		cWall(mSide + 8)
		t_wait(20)
	end
	for i = 0, 3 do
		cWall(mSide + 2)
		cWall(mSide + 5)
		cWall(mSide + 8)
		t_wait(20)
		cWall(mSide + 1)
		cWall(mSide + 4)
		cWall(mSide + 7)
		t_wait(20)
	end
end

function warning(mSide)
	w_wall(mSide, 500)
	t_wait(80)
	wallSAcc(mSide-3, 1, 1, 1, 10)
	wallSAcc(mSide-2, 1, 1, 1, 10)
	wallSAcc(mSide-1, 1, 1, 1, 10)
	wallSAcc(mSide+1, 1, 1, 1, 10)
	wallSAcc(mSide+2, 1, 1, 1, 10)
	wallSAcc(mSide+3, 1, 1, 1, 10)
	t_wait(60)
end

function wiggly(mSides)
	side = math.random(0, mSides)
	moving = math.random(0, 4)
	for i = 0, math.random(30, 50) do
		if moving == 0 then moving = -1
		else moving = 1 end
		wallSAcc(side, 1, 1, 1, 1.125)
		wallSAcc(side + 6, 1, 1, 1, 1.125)
		wallSAcc(side + 12, 1, 1, 1, 1.125)
		wallSAcc(side + 18, 1, 1, 1, 1.125)
		side = side + moving
		moving = math.random(0, 4)
		t_wait(5)
	end
end

function stalling()
	side = 0
	waviness = 0.1
	for i = 0, math.random(40, 50) do
		wavyplier = waviness
		for i = 0, math.random(30, 50) do
			wallSAcc(side, 1, 1, 1, wavyplier)
			t_wait(0.5)
			wallSAcc(side + 1, 1, 1, 1, wavyplier)
			t_wait(0.5)
			wavyplier = wavyplier + .1
		end
		side = side + 2
		waviness = waviness + 0.0005
	end
end