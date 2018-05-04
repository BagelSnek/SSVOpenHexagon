-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

level = 0
levelTracked = 1
incrementTime = 5

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
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
	elseif mKey == 11 then hmcDefAccelBarrage()
	elseif mKey == 12 then hmcDefBarrageSpiralSpin()
	elseif mKey == 13 then hmcDefSpinnerSpiralAcc()
	elseif mKey == 14 then hmcDefBarrageSpiralRnd()
	elseif mKey == 15 then hmcDefBarrageInv()
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }
keys = shuffle(keys)
index = 0

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(2.0)
	l_setSpeedInc(0.05)
	l_setRotationSpeed(0.2)
	l_setRotationSpeedMax(0.5)
	l_setRotationSpeedInc(0.02)
	l_setDelayMult(1.2)
	l_setDelayInc(-0.02)
	l_setFastSpin(0.0)
	l_setSides(5)
	l_setSidesMin(5)
	l_setSidesMax(12)
	l_setIncTime(5)

	l_setPulseMin(60)
	l_setPulseMax(87)
	l_setPulseSpeed(1.2)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(12.9)

	l_setBeatPulseMax(17)
	l_setBeatPulseDelayMax(24.8)

	l_setRadiusMin(40)
	l_addTracked("levelTracked", "level")
	l_enableRndSideChanges(false)

	l_setSwapEnabled(true)
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
		index = 1
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()	
	u_playSound("beep.ogg")
	u_playSound("VeeEndurance_test.ogg")
	
	level = level + 1
	levelTracked = level + 1
	incrementTime = incrementTime + 5
	
	if (l_getSides() < 12) then
		l_setSides(l_getSides() + 1)
	end

	l_setIncTime(incrementTime)

	m_messageAddImportant("level: "..(level + 1).." / time: "..incrementTime, 150)
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- continuous direction change (even if not on level increment)
dirChangeTime = 500

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
	dirChangeTime = dirChangeTime - mFrameTime;
	if dirChangeTime < 0 then
		l_setRotationSpeed(l_getRotationSpeed() * -1.0)
		dirChangeTime = 500
	end 
end