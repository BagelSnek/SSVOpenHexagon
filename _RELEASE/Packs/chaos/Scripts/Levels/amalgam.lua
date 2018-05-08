-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(lKey, mKey)
	-- aperigon
	if lKey == 1 then
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
			if mKey == 0 then rWallEx(getRandomSide(), level - 1) t_wait(getPerfectDelayDM(THICKNESS) * 8.18)
		end

	-- euclidean plane crash
	elseif lKey == 3 then
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
			if mKey == 0 then pBarrageSpiral(bRandom(5, 9), 0.41, 1)
		elseif mKey == 1 then pMirrorSpiralDouble(bRandom(8, 10), 0)
		elseif mKey == 2 then pMirrorSpiral(bRandom(2, 5), 0)
		end

	-- labyrinth
	elseif lKey == 6 then
			if mKey == 0 then cBarrage(getRandomSide()) t_wait(getPerfectDelayDM(THICKNESS) * 8.18)
		end

	-- pi
	elseif lKey == 7 then
			if mKey == 0 then cWallEx(getRandomSide(), bRandom(1, 2)) t_wait(getPerfectDelay(THICKNESS) * 2.5)
		elseif mKey == 1 then pMirrorSpiralDouble(bRandom(1, 2), 4)
		elseif mKey == 2 then rWallEx(getRandomSide(), bRandom(1, 2)) t_wait(getPerfectDelay(THICKNESS) * 2.8)
		elseif mKey == 3 then pMirrorWallStrip(1, 2)
		elseif mKey == 4 then rWallEx(getRandomSide(), 1) t_wait(getPerfectDelay(THICKNESS) * 2.3)
		elseif mKey == 5 then cWallEx(getRandomSide(), 7) t_wait(getPerfectDelay(THICKNESS) * 2.7)
		end

	-- pointless
	elseif lKey == 8 then
			if mKey == 0 then pAltBarrage(bRandom(2, 4), 2) 
		elseif mKey == 1 then pMirrorSpiral(bRandom(2, 5), getHalfSides() - 3)
		elseif mKey == 2 then pBarrageSpiral(bRandom(0, 3), 1, 1)
		elseif mKey == 3 then pInverseBarrage(0)
		elseif mKey == 4 then pTunnel(bRandom(1, 3))
		end

	-- second dimension
	elseif lKey == 9 then
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
			if mKey == 0 then pACBarrage()
		elseif mKey == 1 then pACBarrageMulti()
		elseif mKey == 2 then pACBarrageMultiAltDir()
		end

	-- centrifugal force
	elseif lKey == 11 then
			if mKey == 0 then hmcSimpleBarrageSNeigh(getRandomSide(), getRandomDir() * curveSpeed, 2) t_wait(getPerfectDelayDM(THICKNESS) * 6.22)
		end

	-- disc-o
	elseif lKey == 12 then
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
			if mKey == 0 then cBarrage(getRandomSide()) t_wait(getPerfectDelayDM(THICKNESS) * 6.1)
		end

	-- incongruence
	elseif lKey == 14 then
			if mKey == 0 then pRCBarrage()
		elseif mKey == 1 then pRCBarrageDouble()
		elseif mKey == 2 then pRCBarrageSpin()
		end

	-- massacre
	elseif lKey == 15 then
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
			if mKey == 0 then pTrapBarrage(getRandomSide()) 
		elseif mKey == 1 then pTrapBarrageDouble(getRandomSide())
		elseif mKey == 2 then pTrapBarrageInverse(getRandomSide())
		elseif mKey == 3 then pTrapBarrageAlt(getRandomSide())
		end

	-- reppaws
	elseif lKey == 17 then
			if mKey == 0 then cBarrageN(getRandomSide(), gap) t_wait(getPerfectDelayDM(THICKNESS) * 6)
		elseif mKey == 1 then hmcSimpleBarrageSNeigh(getRandomSide(), 0, gap) t_wait(getPerfectDelayDM(THICKNESS) * 6)
		end

	-- slither
	elseif lKey == 18 then
			if mKey == 0 then hmcDefSpinnerSpiralAcc()
		end

	end
end

-- level specific keys
	apeirogonKeys = { 5, 5, 7, 0, 0, 1, 1, 2, 2, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9, 9 }
	commandoKeys = { 10, 4, 4, 0 }
	euclideanpcKeys = { 5, 8, 8, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8, 9, 10, 10, 10 }
	flatteringshapeKeys = { 5, 5, 6, 0, 0, 1, 1, 2, 2, 3, 4, 5, 5, 6, 7, 7 }
	goldenratioKeys = { 3, 6, 6, 0, 0, 1, 1, 2 }
	labyrinthKeys = { 10, 4, 4, 0 }
	piKeys = { 10, 20, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5 }
	pointlessKeys = { 5, 5, 6, 0, 0, 1, 1, 2, 2, 3, 3, 4 }
	seconddimensionKeys = { 5, 5, 7, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8, 9, 10, 10, 10 }
	acceleradiantKeys = { 3, 5, 7, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0, 0 }
	centrifugalKeys = { 5, 15, 15, 0 }
	discoKeys = { 5, 6, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 10, 8, 8, 9, 9, 9, 9, 6, 11, 11, 10, 10 }
	gforceKeys = { 5, 4, 4, 0 }
	incongruenceKeys = { 5, 4, 6, 0, 0, 1, 1, 2 }
	massacreKeys = { 5, 6, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }
	polyhedrugKeys = { 3, 4, 4, 0, 0, 1, 1, 2, 2, 3, 3 }
	reppawsKeys = { 5, 32, 32, 0, 0, 0, 1, 1, 1 }
	slitherKeys = { 3, 4, 4, 0 }

levels = { "apeirogon", "commando",  "euclidean plane crash", "flattering shape", "golden ratio", "labyrinth", "pi", "pointless", "second dimension",
"acceleradiant", "centrifugal force", "disc-o", "g-force", "incongruence", "massacre", "polyhedrug", "reppaws", "slither" }
levelKeys = { apeirogonKeys, commandoKeys, euclideanpcKeys, flatteringshapeKeys, goldenratioKeys, labyrinthKeys, piKeys, pointlessKeys, seconddimensionKeys,
acceleradiantKeys, centrifugalKeys, discoKeys, gforceKeys, incongruenceKeys, massacreKeys, polyhedrugKeys, reppawsKeys, slitherKeys }
index = 1

level = 1
curveSpeed = 1
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
	l_setPulseSpeed(1.5)
	l_setPulseSpeedR(1.5)
	l_setPulseDelayMax(25.6)

	l_setBeatPulseMax(20)
	l_setBeatPulseDelayMax(25.6)

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
	mLevel = levels[index]
	i = levelKeys[index][1]
	repeat
		mPattern = levelKeys[index][bRandom(4, #levelKeys[index])]
		addPattern(index, mPattern)
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
		smin, smax = smin + 1, smin;
	end
	if level < 5 then
		commandoKeys[2], commandoKeys[3], labyrinthKeys[2], labyrinthKeys[3], polyhedrugKeys[2], polyhedrugKeys[3], slitherKeys[2], slitherKeys[3] =
		2 + level * 2, 2 + level * 2, 2 + level, 2 + level, 2 + level * 2, 2 + level * 2, 2 + level * 2, 2 + level * 2
	end
	
	incongruenceKeys[2] = bRandom(4, 6)
	incongruenceKeys[3] = incongruenceKeys[2] + bRandom(1, 3)
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