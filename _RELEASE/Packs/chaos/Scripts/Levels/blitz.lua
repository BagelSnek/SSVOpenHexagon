-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")
u_execScript("remasteredpatterns.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then blitzBarrage(bRandom(10,20), 1, 0.4, 0.35)
	elseif mKey == 1 then blitzRing(bRandom(2, 3), 1, 0.4, 0.35)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 1 }
keys = shuffle(keys)
index = 0
special = bRandom(0, 1)

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(5.0)
	l_setSpeedInc(0.1)
	l_setRotationSpeed(0.25)
	l_setRotationSpeedMax(0.5)
	l_setRotationSpeedInc(0.05)
	l_setDelayMult(1.00)
	l_setDelayInc(-0.075)
	l_setFastSpin(0.0)
	l_setSides(7)
	l_setSidesMin(6)
	l_setSidesMax(6)
	l_setIncTime(10)

	l_setPulseMin(60)
	l_setPulseMax(80)
	l_setPulseSpeed(0.75)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(50)

	l_setBeatPulseMax(45)
	l_setBeatPulseDelayMax(25)

	l_setRadiusMin(35)
	l_enableRndSideChanges(false)

	enableSwapIfDMGreaterThan(1.0)
end

bFlip = 1

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	if special == 0 then
		sync = bRandom(0, 1)
		hueModifier = sync
		hmcSimpleBarrage(sync * bFlip)
		bFlip = -bFlip
		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)) * 5)
	else
		addPattern(keys[index])
		if index == #keys then
			keys = shuffle(keys)
			index = 0
		end

		index = index + 1
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
	special = bRandom(0, 1)
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- continuous direction change (even if not on level increment)
dirChangeTime = bRandom(4, 10) * 25

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
	dirChangeTime = dirChangeTime - mFrameTime
	if dirChangeTime <= 0 then
		l_setRotationSpeed(-l_getRotationSpeed())
		dirChangeTime = bRandom(4, 10) * 25
	end
end