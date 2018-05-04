-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")
u_execScript("remasteredpatterns.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(lKey)
	patterned = false

	-- aperigon
	if lKey == 1 then
		mKey = apeirogonKeys[bRandom(4, #apeirogonKeys)]
			if mKey == 0 then pAltBarrage(bRandom(2, 3), 2) 
		elseif mKey == 1 then pBarrageSpiral(3, 0.6, 1)
		elseif mKey == 2 then pInverseBarrage(0)
		elseif mKey == 3 then pTunnel(bRandom(1, 3))
		elseif mKey == 4 then pMirrorWallStrip(1, 0)
		elseif mKey == 5 then pWallExVortex(0, bRandom(1, 2), 1)
		elseif mKey == 6 then pDMBarrageSpiral(bRandom(4, 7), 0.4, 1)
		elseif mKey == 7 then pRandomBarrage(bRandom(2, 5), 2.25)
		elseif mKey == 8 then pMirrorSpiralDouble(bRandom(4, 6), 0)
		elseif mKey == 9 then pMirrorSpiral(bRandom(2, 4), 0)
		end

	-- commando
	elseif lKey == 2 then
		rWallEx(getRandomSide(), level - 1)
		t_wait(getPerfectDelayDM(THICKNESS) * 8.18)

	-- euclidean plane crash
	elseif lKey == 3 then
		mKey = euclideanpcKeys[bRandom(4, #euclideanpcKeys)]
			if mKey ==  0 then pAltBarrage(bRandom(2, 4), 2) 
		elseif mKey ==  1 then pMirrorSpiral(bRandom(3, 6), 0)
		elseif mKey ==  2 then pBarrageSpiral(bRandom(0, 3), 1, 1)
		elseif mKey ==  3 then pBarrageSpiral(bRandom(0, 2), 1.2, 2)
		elseif mKey ==  4 then pBarrageSpiral(2, 0.7, 1)
		elseif mKey ==  5 then pInverseBarrage(0)
		elseif mKey ==  6 then pTunnel(bRandom(1, 3))
		elseif mKey ==  7 then pMirrorWallStrip(1, 0)
		elseif mKey ==  8 then pWallExVortex(0, 1, 1)
		elseif mKey ==  9 then pDMBarrageSpiral(bRandom(4, 7), 0.4, 1)
		elseif mKey == 10 then pRandomBarrage(bRandom(2, 4), 2.25)
		end
	
	-- flattering shape
	elseif lKey == 4 then
		mKey = flatteringshapeKeys[bRandom(4, #flatteringshapeKeys)]
			if mKey == 0 then pAltBarrage(bRandom(2, 4), 2) 
		elseif mKey == 1 then pMirrorSpiral(bRandom(3, 6), 0)
		elseif mKey == 2 then pBarrageSpiral(bRandom(0, 3), 1, 1)
		elseif mKey == 3 then pBarrageSpiral(bRandom(0, 2), 1.2, 2)
		elseif mKey == 4 then pBarrageSpiral(2, 0.7, 1)
		elseif mKey == 5 then pInverseBarrage(0)
		elseif mKey == 6 then pTunnel(bRandom(1, 3))
		elseif mKey == 7 then pMirrorWallStrip(1, 0)
		end
	
	-- golden ratio
	elseif lKey == 5 then
		mKey = goldenratioKeys[bRandom(4, #goldenratioKeys)]
			if mKey == 0 then pBarrageSpiral(bRandom(5, 9), 0.41, 1)
		elseif mKey == 1 then pMirrorSpiralDouble(bRandom(8, 10), 0)
		elseif mKey == 2 then pMirrorSpiral(bRandom(2, 5), 0)
		end

	-- labyrinth
	elseif lKey == 6 then
		cBarrage(getRandomSide())
		t_wait(getPerfectDelayDM(THICKNESS) * 8.18)
	
	-- pi
	elseif lKey == 7 then
		mKey = piKeys[bRandom(4, #piKeys)]
			if mKey == 0 then cWallEx(getRandomSide(), bRandom(1, 2)) t_wait(getPerfectDelay(THICKNESS) * 2.5)
		elseif mKey == 1 then pMirrorSpiralDouble(bRandom(1, 2), 4)
		elseif mKey == 2 then rWallEx(getRandomSide(), bRandom(1, 2)) t_wait(getPerfectDelay(THICKNESS) * 2.8)
		elseif mKey == 3 then pMirrorWallStrip(1, 2)
		elseif mKey == 4 then rWallEx(getRandomSide(), 1) t_wait(getPerfectDelay(THICKNESS) * 2.3)
		elseif mKey == 5 then cWallEx(getRandomSide(), 7) t_wait(getPerfectDelay(THICKNESS) * 2.7)
		end

	-- pointless
	elseif lKey == 8 then
		mKey = pointlessKeys[bRandom(4, #pointlessKeys)]
			if mKey == 0 then pAltBarrage(bRandom(2, 4), 2) 
		elseif mKey == 1 then pMirrorSpiral(bRandom(2, 5), getHalfSides() - 3)
		elseif mKey == 2 then pBarrageSpiral(bRandom(0, 3), 1, 1)
		elseif mKey == 3 then pInverseBarrage(0)
		elseif mKey == 4 then pTunnel(bRandom(1, 3))
		end
	
	-- second dimension
	elseif lKey == 9 then
		mKey = seconddimensionKeys[bRandom(4, #seconddimensionKeys)]
			if mKey ==  0 then pAltBarrage(bRandom(2, 4), 2) 
		elseif mKey ==  1 then pMirrorSpiral(bRandom(3, 6), 0)
		elseif mKey ==  2 then pBarrageSpiral(bRandom(0, 3), 1, 1)
		elseif mKey ==  3 then pBarrageSpiral(bRandom(0, 2), 1.2, 2)
		elseif mKey ==  4 then pBarrageSpiral(2, 0.7, 1)
		elseif mKey ==  5 then pInverseBarrage(0)
		elseif mKey ==  6 then pTunnel(bRandom(1, 3))
		elseif mKey ==  7 then pMirrorWallStrip(1, 0)
		elseif mKey ==  8 then pWallExVortex(0, 1, 1)
		elseif mKey ==  9 then pDMBarrageSpiral(bRandom(4, 7), 0.4, 1)
		elseif mKey == 10 then pRandomBarrage(bRandom(2, 4), 2.25)
		end
	
	-- acceleradiant
	elseif lKey == 10 then
		t_wait(getPerfectDelayDM(THICKNESS) * 9.22)
		mKey = acceleradiantKeys[bRandom(1, #acceleradiantKeys)]
			if mKey == 0 then pACBarrage()
		elseif mKey == 1 then pACBarrageMulti()
		elseif mKey == 2 then pACBarrageMultiAltDir()
		end
	
	-- centrifugal force
	elseif lKey == 11 then
		hmcSimpleBarrageSNeigh(getRandomSide(), getRandomDir() * curveSpeed, 2) 
		t_wait(getPerfectDelayDM(THICKNESS) * 6.22)
	
	-- disc-o
	elseif lKey == 12 then
		mKey = discoKeys[bRandom(4, #discoKeys)]
			if mKey == 0 then pAltBarrage(bRandom(1, 3), 2) 
		elseif mKey == 1 then pMirrorSpiral(bRandom(2, 4), 0)
		elseif mKey == 2 then pBarrageSpiral(bRandom(0, 3), 1, 1)
		elseif mKey == 3 then pBarrageSpiral(bRandom(0, 2), 1.2, 2)
		elseif mKey == 4 then pBarrageSpiral(2, 0.7, 1)
		elseif mKey == 5 then pInverseBarrage(0)
		elseif mKey == 6 then hmcDefBarrageSpiral()
		elseif mKey == 7 then pMirrorWallStrip(1, 0)
		elseif mKey == 8 then hmcDefSpinner()
		elseif mKey == 9 then hmcDefBarrage()
		elseif mKey == 10 then hmcDef2Cage()
		elseif mKey == 11 then hmcDefBarrageSpiralSpin()
		end
	
	-- g-force
	elseif lKey == 13 then
		cBarrage(getRandomSide()) 
		t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
	
	-- incongruence
	elseif lKey == 14 then
		mKey = incongruenceKeys[bRandom(4, #incongruenceKeys)]
			if mKey == 0 then pRCBarrage()
		elseif mKey == 1 then pRCBarrageDouble()
		elseif mKey == 2 then pRCBarrageSpin()
		end
	
	-- massacre
	elseif lKey == 15 then
		mKey = massacreKeys[bRandom(4, #massacreKeys)]
			if mKey == 0 then pAltBarrage(bRandom(1, 2), 2) 
		elseif mKey == 1 then pBarrageSpiral(2, 0.6, 1)
		elseif mKey == 2 then pInverseBarrage(0)
		elseif mKey == 3 then hmcDefBarrageSpiralFast()
		elseif mKey == 4 then pWallExVortex(0, 1, 1)
		elseif mKey == 5 then pDMBarrageSpiral(bRandom(2, 4), 0.4, 1)
		elseif mKey == 6 then pRandomBarrage(bRandom(1, 3), 2.25)
		elseif mKey == 7 then pInverseBarrage(0)
		elseif mKey == 8 then pMirrorWallStrip(1, 0)
		elseif mKey == 9 then hmcDefSpinner()
		elseif mKey == 10 then hmcDefBarrageSpiral()
		elseif mKey == 11 then hmcDef2CageD()
		elseif mKey == 12 then hmcDefBarrageSpiralSpin()
		elseif mKey == 13 then hmcDefSpinnerSpiralAcc()
		elseif mKey == 14 then hmcDefBarrageSpiralRnd()
		elseif mKey == 15 then hmcDefBarrageInv()
		end
	
	-- polyhedrug
	elseif lKey == 16 then
		mKey = polyhedrugKeys[bRandom(4, #polyhedrugKeys)]
			if mKey == 0 then pTrapBarrage(bRandom(0, l_getSides())) 
		elseif mKey == 1 then pTrapBarrageDouble(bRandom(0, l_getSides()))
		elseif mKey == 2 then pTrapBarrageInverse(bRandom(0, l_getSides()))
		elseif mKey == 3 then pTrapBarrageAlt(bRandom(0, l_getSides()))
		end
	
	-- reppaws
	elseif lKey == 17 then
		mKey = reppawsKeys[bRandom(4, #reppawsKeys)]
			if mKey == 0 then cBarrageN(getRandomSide(), gap) t_wait(getPerfectDelayDM(THICKNESS) * 6)
		elseif mKey == 1 then hmcSimpleBarrageSNeigh(getRandomSide(), 0, gap) t_wait(getPerfectDelayDM(THICKNESS) * 6)
		end
	
	-- slither
	elseif lKey == 18 then
		hmcDefSpinnerSpiralAcc()

	end

	patterned = true
end

-- level specific keys
	apeirogonKeys = { 5, 5, 7, 0, 0, 1, 1, 2, 2, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 9 }
	commandoKeys = { 10, levelSide, levelSide }
	euclideanpcKeys = { 5, 8, 8, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8, 9, 10, 10, 10 }
	flatteringshapeKeys = { 5, 5, 6, 0, 0, 1, 1, 2, 2, 3, 4, 5, 5, 6, 7, 7 }
	goldenratioKeys = { 3, 6, 6, 0, 0, 1, 1, 2 }
	labyrinthKeys = { 10, levelSide, levelSide }
	piKeys = { 10, 20, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5 }
	pointlessKeys = { 5, 5, 6, 0, 0, 1, 1, 2, 2, 3, 3, 4 }
	seconddimensionKeys = { 5, 5, 7, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8, 9, 10, 10, 10 }
	acceleradiantKeys = { 3, 5, 7, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0, 0 }
	centrifugalKeys = { 5, 15, 15 }
	discoKeys = { 5, 6, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 10, 8, 8, 9, 9, 9, 9, 6, 11, 11, 10, 10 }
	gforceKeys = { 5, 4, 4 }
	incongruenceKeys = { 5, lowerBound, upperBound, 0, 0, 1, 1, 2 }
	massacreKeys = { 5, 6, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }
	polyhedrugKeys = { 3, levelSide, levelSide, 0, 0, 1, 1, 2, 2, 3, 3 }
	reppawsKeys = { 5, 32, 32, 0, 0, 0, 1, 1, 1 }
	slitherKeys = { 3, levelSide, levelSide }

keys = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
levels = { "apeirogon", "commando",  "euclidean plane crash", "flattering shape", "golden ratio", "labyrinth", "pi", "pointless", "second dimension",
"acceleradiant", "centrifugal force", "disc-o", "g-force", "incongruence", "massacre", "polyhedrug", "reppaws", "slither" }
levelKeys = { apeirogonKeys, commandoKeys, euclideanpcKeys, flatteringshapeKeys, goldenratioKeys, labyrinthKeys, piKeys, pointlessKeys, seconddimensionKeys,
acceleradiantKeys, centrifugalKeys, discoKeys, gforceKeys, incongruenceKeys, massacreKeys, polyhedrugKeys, reppawsKeys, slitherKeys }
index = 1

level = 1
levelSide = 4
curveSpeed = 1
lowerBound = 4
upperBound = 6
gap = 6
smin = 2
smax = 2

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(2.3)
	l_setSpeedInc(0.05)
	l_setRotationSpeed(0.2)
	l_setRotationSpeedMax(0.4)
	l_setRotationSpeedInc(0.03)
	l_setDelayMult(1.0)
	l_setDelayInc(-0.01)
	l_setFastSpin(60.0)
	l_setSides(6)
	l_setSidesMin(6)
	l_setSidesMax(6)
	l_setIncTime(10)

	l_setPulseMin(60)
	l_setPulseMax(75)
	l_setPulseSpeed(1.2)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(12)

	l_setBeatPulseMax(20)
	l_setBeatPulseDelayMax(20)

	l_addTracked("mLevel", "patterns")
	l_addTracked("level", "level")

	l_setSwapEnabled(true)
	l_enableRndSideChanges(false)
end

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	index = bRandom(1, 18)
	l_setSides(bRandom(levelKeys[index][2], levelKeys[index][3]))
	mLevel = levels[keys[index]]
	i = levelKeys[index][1]
	repeat
		addPattern(keys[index])
		i = i - 1
	until i <= 0
	t_wait(getPerfectDelayDM(THICKNESS) * 10)
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
	level = level + 1

	if curveSpeed < 3 then
		curveSpeed = curveSpeed + 0.4
	end
	if gap > 2 then
		gap = gap - 1
	end
	if smax < 4 then
		smax = smax + 1;
	else
		smin = smin + 1;
		smax = smin;
	end
	if levelSide < 10 then
		levelSide = 2 + level * 2
	end
	
	lowerBound = bRandom(4, 6)
	upperBound = lowerBound + bRandom(1, 3)
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- continuous direction change (even if not on level increment)
dirChangeTime = 300

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
	dirChangeTime = dirChangeTime - mFrameTime;
	if dirChangeTime < 0 then
		-- do not change direction while fast spinning
		if u_isFastSpinning() == false then
			l_setRotationSpeed(l_getRotationSpeed() * -1.0)
			dirChangeTime = 300
		end
	end 
end