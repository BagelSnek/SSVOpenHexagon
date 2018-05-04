-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")
u_execScript("remasteredpatterns.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then fracWallRing(bRandom(3, 6) / 2.0)
		elseif mKey == 1 then fracAccWallRing(bRandom(3, 6) / 2.0, (bRandom(1, 3) / 2.0) * cFlip * ((1 / dieDiff) / 4), 0, 0, 0, false)
		elseif mKey == 2 then fracAccWallRing(bRandom(3, 6) / 2.0, (bRandom(1, 3) / 2.0) * cFlip * ((1 / dieDiff) / 4),
			bRandom(5, 10) / 100.0 * cFlip * ((1 / dieDiff) / 4), 
			bRandom(5, 35) / -10.0 * ((1 / dieDiff) / 4), 
			bRandom(5, 35) / 10.0 * ((1 / dieDiff) / 4), true)
	end
end

cFlip = 1
hueModifier = 0

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(2.0)
	l_setSpeedInc(0.2)
	l_setRotationSpeed(0.2)
	l_setRotationSpeedMax(0.4)
	l_setRotationSpeedInc(0.05)
	l_setDelayMult(1.0)
	l_setDelayInc(-0.02)
	l_setFastSpin(0.0)
	l_setSides(4)
	l_setSidesMin(4)
	l_setSidesMax(100)
	l_setIncTime(10)

	l_setPulseMin(60)
	l_setPulseMax(75)
	l_setPulseSpeed(1.0)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(12.9)

	l_setBeatPulseMax(20)
	l_setBeatPulseDelayMax(20)

	l_addTracked("dieSides", "die")
	l_addTracked("special", "rolled")

	l_enableRndSideChanges(false)
end

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	dieSides = "d"..l_getSides()
	special = bRandom(1, l_getSides())
	dieDiff = special / (l_getSides() * 1.0)
	m_messageAddImportant("You rolled a "..special.." on a "..dieSides, 100)
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	cFlip = -cFlip

	if dieDiff <= .25 then addPattern(2)
	elseif dieDiff <= .5 then addPattern(bRandom(1,2))
	elseif dieDiff <= .75 then addPattern(bRandom(0,1))
	else addPattern(0)
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
	if l_getSides() == 4 then l_setSides(6)
	elseif l_getSides() == 6 then l_setSides(8)
	elseif l_getSides() == 8 then l_setSides(10)
	elseif l_getSides() == 10 then l_setSides(12)
	elseif l_getSides() == 12 then l_setSides(20)
	elseif l_getSides() == 20 then l_setSides(100)
	end

	dieSides = "d"..l_getSides()
	special = bRandom(1, l_getSides())
	dieDiff = special / (l_getSides() * 1.0)
	m_messageAddImportant("You rolled a "..special.." on a "..dieSides, 100)
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
end