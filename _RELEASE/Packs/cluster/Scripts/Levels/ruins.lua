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
		if mKey == 0 then cWall(getRandomSide())
	elseif mKey == 1 then trap()
	elseif mKey == 2 then hintTrap(getRandomSide())
	elseif mKey == 3 then holyHeck(10)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = {0, 0, 0, 1, 1, 2, 2, 3} --0, 0, 0, 1, 1, 2, 2, 3
keys = shuffle(keys)
index = 0
swoosh = 0
hueModifier = 0.5

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(1.9)
	l_setSpeedInc(0.1)
	l_setRotationSpeed(0.05)
	l_setRotationSpeedMax(0.4)
	l_setRotationSpeedInc(0.001)
	l_setDelayMult(1.0)
	l_setDelayInc(-0.00)
	l_setFastSpin(50.0)
	l_setSides(9)
	l_setSidesMin(9)
	l_setSidesMax(9)
	l_setIncTime(15)

	l_setPulseMin(60)
	l_setPulseMax(87)
	l_setPulseSpeed(1.2)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(12.9)

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
	wallRound(getRandomSide())
	t_wait(30)
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
end