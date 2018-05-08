-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")
u_execScript("ctpatterns.lua")
math.random()

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then colorSomeWalls()
	elseif mKey == 1 then colorSpiral(0)
	elseif mKey == 2 then colorSpiral(1)
	elseif mKey == 3 then colorWobbly(20)
	elseif mKey == 4 then colorSpiralAcc(1)
	elseif mKey == 5 then colorSomeRandoWalls()
	elseif mKey == 6 then wallHMCurveAcc(getRandomSide(), 10, 0.01, 7, 13, true)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 4, 5, 5, 5, 5, 6, 6, 6} --0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 4, 5, 5, 5, 5, 6, 6, 6
keys = shuffle(keys)
index = 0
swoosh = 0

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(2.0)
	l_setSpeedInc(0.1)
	l_setRotationSpeed(0.95)
	l_setRotationSpeedMax(1.0)
	l_setRotationSpeedInc(0.1)
	l_setDelayMult(1.0)
	l_setDelayInc(0.00)
	l_setFastSpin(0.0)
	l_setSides(6)
	l_setSidesMin(6)
	l_setSidesMax(6)
	l_setIncTime(120)

	l_setPulseMin(60)
	l_setPulseMax(100)
	l_setPulseSpeed(4)
	l_setPulseSpeedR(.5)
	l_setPulseDelayMax(1)

	l_setBeatPulseMax(17)
	l_setBeatPulseDelayMax(24.8)

	l_setSwapEnabled(false)
	
	l_setRadiusMin(50)
end

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	addPattern(keys[index])
	index = index + 1

	if index - 1 == #keys then
		index = 0
	end
	t_wait(15)
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
	wiggly()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
end