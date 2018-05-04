-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

function addPattern(mKey)
		if mKey == 0 then pRCBarrage()
	elseif mKey == 1 then pRCBarrageDouble()
	elseif mKey == 2 then pRCBarrageSpin()
	elseif mKey == 3 then hmcDefBarrageSpiral()
	elseif mKey == 4 then hmcDefBarrageInv()
	elseif mKey == 5 then hmcDefBarrageSpiralSpin()
	elseif mKey == 6 then hmcDefBarrageSpiralRnd()
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = {0, 0, 0, 1, 1, 1, 2, 3, 4, 5, 6}
keys = shuffle(keys)
index = 0
lowerBound = 5
upperBound = 7

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(2.5)
	l_setSpeedInc(0.01)
	l_setRotationSpeed(0.25)
	l_setRotationSpeedMax(0.5)
	l_setRotationSpeedInc(0.01)
	l_setDelayMult(1)
	l_setDelayInc(-0.01)
	l_setFastSpin(0.0)
	l_setSides(6)
	l_setSidesMin(5)
	l_setSidesMax(12)
	l_setIncTime(15)

	l_setPulseMin(60)
	l_setPulseMax(80)
	l_setPulseSpeed(1.2)
	l_setPulseSpeedR(1)
	l_setPulseDelayMax(17.15)

	l_setBeatPulseMax(25)
	l_setBeatPulseDelayMax(34.3)

	l_addTracked("upperBound", "max")
	l_enableRndSideChanges(false)

	l_setRadiusMin(40)

	l_setSwapEnabled(true)
end

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	m_messageAddImportant("Sides ("..lowerBound.." / "..upperBound..")", 170)
	e_eventWaitS(50)
	m_messageAddImportant("impossible!", 130)
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	l_setSides(bRandom(5, upperBound))
	addPattern(keys[index])
	index = index + 1
	
	if index - 1 == #keys then
		index = 1
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
	upperBound = upperBound + 1
	m_messageAddImportant("Sides ("..lowerBound.." / "..upperBound..")", 170)
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
end