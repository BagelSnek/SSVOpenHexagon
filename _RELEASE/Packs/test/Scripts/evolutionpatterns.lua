u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("utils.lua")
u_execScript("alternativepatterns.lua")
u_execScript("nextpatterns.lua")

hueModifier = 0.2
sync = false
syncRndMin = 0
syncRndMax = 0

curveMult = 1

--syncCurveWithRotationSpeed: self explainatory, read the name of the function
function syncCurveWithRotationSpeed(mRndMin, mRndMax)
	sync = true
	syncRndMin = mRndMin
	syncRndMax = mRndMax
end

--setCurveMult: sets mMult to given value
function setCurveMult(mMult)
	curveMult = mMult
end

--wallHMCurveAcc: creates a wall at a given side which can curve independent of the rotation and accelerate
function wallHMCurveAcc(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	if sync == true then
		mCurve = l_getRotationSpeed() * 10.0
		mCurve = mCurve + (math.random(syncRndMin, syncRndMax) / 100.0)
	end

	w_wallHModCurveData(hueModifier, mSide, THICKNESS, mCurve * (u_getDifficultyMult() ^ 0.25) * curveMult, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
end

--wallHMCurve: creates a wall at a given side which curves at a given rate
function wallHMCurve(mSide, mCurve)
	wallHMCurveAcc(mSide, mCurve, 0, 0, 0, false)
end

--hmcBarrageN: creates a connected wall that curves based on a given value
function hmcBarrageN(mSide, mNeighbors, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	for i = mNeighbors, l_getSides() - 2 - mNeighbors, 1 do
		wallHMCurveAcc(mSide + i + 1, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end
end

--hmcBarrageS: same as hmcBarrageN, but mNeighbors is set to 0
function hmcBarrageS(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	hmcBarrageN(mSide, 0, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong);
end

--hmcBarrage: runs hmcBarrageS on a random side with given curve/acceleration values
function hmcBarrage(mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	hmcBarrageS(getRandomSide(), mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong);
end

--hmcSimpleBarrage: runs hmcBarrageN on a random side, with only mCurve modified
function hmcSimpleBarrage(mCurve)
	hmcBarrageN(getRandomSide(), 0, mCurve, 0, 0, 0, false);
end

--hmcSimpleBarrageS: same as hmcSimpleBarrage, but mSide is required
function hmcSimpleBarrageS(mSide, mCurve)
	hmcBarrageN(mSide, 0, mCurve, 0, 0, 0, false);
end

--hmcSimpleBarrageSNeigh: same as hmcSimpleBarrageS, but with mNeighbors to be filled
function hmcSimpleBarrageSNeigh(mSide, mCurve, mNeighbors)
	hmcBarrageN(mSide, mNeighbors, mCurve, 0, 0, 0, false);
end

--hmcSimpleTwirl: creates walls with increasing curve speed for each time it makes one
function hmcSimpleTwirl(mTimes, mCurve, mCurveAdd)
	startSide = getRandomSide()
	currentSide = startSide
	loopDir = getRandomDir()
	delay = getPerfectDelayDM(THICKNESS) * 5.7
	j = 0
	
	currentCurve = mCurve	

	for i = 0, mTimes do
		hmcSimpleBarrageS(startSide + j, currentCurve)
		j = j + loopDir
		currentCurve = currentCurve + mCurveAdd
		t_wait(delay)
	end
end

--hmcSimpleCage: creates curving walls with alternating directions
function hmcSimpleCage(mCurve, mDir)
	side = getRandomSide()
	oppositeSide = side + getHalfSides()

	wallHMCurve(side, mCurve)
	wallHMCurve(oppositeSide, mCurve * mDir)
end

--hmcSimpleCageS: creates curving walls with alternating directions at a given side
function hmcSimpleCageS(mCurve, mDir, mSide)
	oppositeSide = mSide + getHalfSides()

	wallHMCurve(mSide, mCurve)
	wallHMCurve(oppositeSide, mCurve * mDir)
end

--hmcSimpleSpinner: creates a spiral with a curve
function hmcSimpleSpinner(mCurve)
	side = getRandomSide()

	for i = 0, l_getSides() / 2, 1 do
		wallHMCurve(side + i * 2, mCurve)
	end
end

--hmcSimpleSpinnerS: creates a spiral with a curve at a given side
function hmcSimpleSpinnerS(mSide, mCurve)
	for i = 0, l_getSides() / 2, 1 do
		wallHMCurve(mSide + i * 2, mCurve)
	end
end

--hmcSimpleSpinnerSAcc: creates a spiral with an accelerating curve at a given side
function hmcSimpleSpinnerSAcc(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	for i = 0, l_getSides() / 2, 1 do
		wallHMCurveAcc(mSide + i * 2, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end
end

--hmcDefSpinner: creates a ring where every 2nd wall is missing and curves
function hmcDefSpinner()
	t_wait(getPerfectDelayDM(THICKNESS) * 3.2)
	hmcSimpleSpinner(math.random(10, 19) / 10.0 * getRandomDir())
	t_wait(getPerfectDelayDM(THICKNESS) * 5.9)
end

--hmcDefBarrage: predefined hmcSimpleBarrage
function hmcDefBarrage()
	t_wait(getPerfectDelayDM(THICKNESS) * 3.1)
	hmcSimpleBarrage(math.random(10, 20) / 10.0 * getRandomDir())
	t_wait(getPerfectDelayDM(THICKNESS) * 5)
end

--hmcDef2Cage: predefined hmcSimpleCageS
function hmcDef2Cage()
	t_wait(getPerfectDelayDM(THICKNESS) * 2.1)
	side = getRandomSide()
	rndspd = math.random(10, 20) / 10.0

	t_wait(getPerfectDelayDM(THICKNESS) * 3.1)
	hmcSimpleCageS(rndspd, -1, side)
	t_wait(getPerfectDelayDM(THICKNESS) * 1.1)
	hmcSimpleCageS(rndspd, -1, side)
	t_wait(getPerfectDelayDM(THICKNESS) * 1.1)
	hmcSimpleCageS(rndspd, -1, side)
	t_wait(getPerfectDelayDM(THICKNESS) * 5.3)
end

--hmcDef2CageD: predefined hmcSimpleCageS
function hmcDef2CageD()
	t_wait(getPerfectDelayDM(THICKNESS) * 2.1)

	side = getRandomSide()
	oppositeSide = getHalfSides() + side
	rndspd = math.random(10, 17) / 10.0

	t_wait(getPerfectDelayDM(THICKNESS) * 3.1)
	hmcSimpleCageS(rndspd, -1, side)
	t_wait(getPerfectDelayDM(THICKNESS) * 1.1)
	hmcSimpleCageS(rndspd, -1, side)
	t_wait(getPerfectDelayDM(THICKNESS) * 1.1)
	hmcSimpleCageS(rndspd, -1, side)
	t_wait(getPerfectDelayDM(THICKNESS) * 6.0)
	hmcSimpleCageS(rndspd, -1, oppositeSide)
	t_wait(getPerfectDelayDM(THICKNESS) * 1.1)
	hmcSimpleCageS(rndspd, -1, oppositeSide)
	t_wait(getPerfectDelayDM(THICKNESS) * 1.1)
	hmcSimpleCageS(rndspd, -1, oppositeSide)
	t_wait(getPerfectDelayDM(THICKNESS) * 9.2)
end

--hmcSimpleBarrageSpiral: combines functionality of a spiral and barrage with a curve
function hmcSimpleBarrageSpiral(mTimes, mDelayMult, mStep, mCurve, mNeighbors)
	delay = getPerfectDelayDM(THICKNESS) * 6.2 * mDelayMult
	startSide = getRandomSide()
	loopDir = mStep * getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		hmcSimpleBarrageSNeigh(startSide + j, mCurve, mNeighbors)
		j = j + loopDir
		t_wait(delay)
		if(l_getSides() < 6) then t_wait(delay * 0.7) end
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
end

--hmcSimpleBarrageSpiralRnd: random hmcSimpleBarrageSpiral
function hmcSimpleBarrageSpiralRnd(mTimes, mDelayMult, mCurve, mNeighbors)
	delay = getPerfectDelayDM(THICKNESS) * 6.2 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		hmcSimpleBarrageSNeigh(getRandomSide(), mCurve, mNeighbors)
		t_wait(delay)
		if(l_getSides() < 6) then t_wait(delay * 0.7) end
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
end

--hmcSimpleBarrageSpiralStatic: almost exactly hmcSimpleBarrageSpiral
function hmcSimpleBarrageSpiralStatic(mTimes, mDelayMult, mStep, mCurve, mNeighbors)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	loopDir = mStep * getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		hmcSimpleBarrageSNeigh(startSide + j, mCurve, mNeighbors)
		j = j + loopDir
		t_wait(delay)
		if(l_getSides() < 6) then t_wait(delay * 0.6) end
	end
	
	t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
end

--hmcDefBarrageSpiral: predefined hmcSimpleBarrageSpiral
function hmcDefBarrageSpiral()
	hmcSimpleBarrageSpiral(math.random(1, 3), 1, 1, math.random(5, 15) / 10.0 * getRandomDir(), 0)
end

--hmcDefBarrageSpiralRnd: predefined hmcSimpleBarrageSpiralRnd
function hmcDefBarrageSpiralRnd()
	hmcSimpleBarrageSpiralRnd(math.random(1, 3), 1, math.random(5, 15) / 10.0 * getRandomDir(), 0)
end

--hmcDefBarrageSpiralFast: predefined fast hmcSimpleBarrageSpiral
function hmcDefBarrageSpiralFast()
	hmcSimpleBarrageSpiral(math.random(1, 3), 0.8, 1, math.random(5, 15) / 10.0 * getRandomDir(), 0)
end

--hmcDefBarrageSpiralSpin: predefined hmcSimpleBarrageSpiralStatic
function hmcDefBarrageSpiralSpin()
	hmcSimpleBarrageSpiralStatic(math.random(7, 14), 0.25, 1, math.random(5, 18) / 10.0 * getRandomDir(), 2)
end

--hmcDefBarrageInv: predefined hmcSimpleBarrageSNeigh
function hmcDefBarrageInv()
	t_wait(getPerfectDelayDM(THICKNESS) * 2.0)
	delay = getPerfectDelay(THICKNESS) * 5.6 
	side = getRandomSide()
	rndspd = math.random(10, 20) / 10.0
	oppositeSide = getRandomSide() + getHalfSides()

	hmcSimpleBarrageSNeigh(side, rndspd * getRandomDir(), 0)
	t_wait(delay)

	hmcSimpleBarrageSNeigh(oppositeSide, rndspd * getRandomDir(), 0)
	t_wait(delay)
end

--hmcDefAccelBarrage: predefined hmcBarrage
function hmcDefAccelBarrage()
	t_wait(getPerfectDelayDM(THICKNESS) * 1.5)
	c = math.random(50, 100) / 1000.0 * getRandomDir()
	min = math.random(5, 35) / 10.0 * -1
	max = math.random(5, 35) / 10.0
	hmcBarrage(0, c, min, max, true)
	t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
end

--hmcDefAccelBarrageDouble: predefined hmcBarrage twice
function hmcDefAccelBarrageDouble()
	t_wait(getPerfectDelayDM(THICKNESS) * 1.5)
	c = math.random(50, 100) / 1000.0 * getRandomDir()
	min = math.random(5, 35) / 10.0 * -1
	max = math.random(5, 35) / 10.0
	hmcBarrage(0, c, min, max, true)
	t_wait(getPerfectDelayDM(THICKNESS) * 2.1)
	hmcBarrage(0, c, min, max, true)
	t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
end

--hmcDefSpinnerSpiral: predefined hmcSimpleSpinnerS
function hmcDefSpinnerSpiral()
	t_wait(getPerfectDelayDM(THICKNESS) * 1.5)
	side = getRandomSide()
	c = math.random(10, 20) / 10.0 * getRandomDir()

	t_wait(getPerfectDelayDM(THICKNESS) * 3.1)

	for i = 0, math.random(4, 8) do
		hmcSimpleSpinnerS(side, c)
		t_wait(getPerfectDelayDM(THICKNESS) * 1.15)
	end

	t_wait(getPerfectDelayDM(THICKNESS) * 5)
end

--getRndMinDM: returns random number between mNum -(difficulty ^ 3) and mNum
function getRndMinDM(mNum)
	return math.random(mNum - u_getDifficultyMult() ^ 3, mNum)
end

--getRndMaxDM: returns random number between mNum and mNum +(difficulty ^ 2.25)
function getRndMaxDM(mNum)
	return math.random(mNum, mNum + u_getDifficultyMult() ^ 2.25)
end

--hmcDefSpinnerSpiralAcc: predefined hmcSimpleSpinnerSAcc
function hmcDefSpinnerSpiralAcc()
	t_wait(getPerfectDelayDM(THICKNESS) * 2.1)
	t_wait(getPerfectDelayDM(THICKNESS) * 2.1)
	side = getRandomSide()
	acc = math.random(getRndMinDM(50), getRndMaxDM(100)) / 1000.0 * getRandomDir()
	min = math.random(getRndMinDM(12), getRndMaxDM(28)) / 10.0 * -1
	max = math.random(getRndMinDM(12), getRndMaxDM(28)) / 10.0

	t_wait(getPerfectDelayDM(THICKNESS) * 3.1)

	for i = 0, math.random(4, 8) do
		hmcSimpleSpinnerSAcc(side, 0, acc, min, max, true)
		t_wait(getPerfectDelay(THICKNESS) * 0.8)
	end

	t_wait(getPerfectDelayDM(THICKNESS) * 5.3)
end