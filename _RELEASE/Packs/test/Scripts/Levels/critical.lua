-- include useful files
u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")
u_execScript("remasteredpatterns.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then 
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0 }
keys = shuffle(keys)
index = 0

-- onInit is an hardcoded function that is called when the level is first loaded
function onInit()
	l_setSpeedMult(1.0)
	l_setSpeedInc(0.1)
	l_setRotationSpeed(0.2)
	l_setRotationSpeedMax(0.4)
	l_setRotationSpeedInc(0.05)
	l_setDelayMult(1.0)
	l_setDelayInc(-0.01)
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

	l_enableRndSideChanges(false)
end

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	m_messageAdd("d4", 150)

	e_eventWaitS(10)
	l_setSides(6)
	m_messageAdd("d6", 150)

	e_eventWaitS(10)
	l_setSides(8)
	m_messageAdd("d8", 150)

	e_eventWaitS(10)
	l_setSides(10)
	m_messageAdd("d10", 150)

	e_eventWaitS(10)
	l_setSides(12)
	m_messageAdd("d12", 150)

	e_eventWaitS(10)
	--l_setSides(20)
	m_messageAdd("d20", 150)

	e_eventWaitS(10)
	--l_setSides(100)
	m_messageAdd("d100", 150)
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	addPattern(keys[index])
	index = index + 1

	if index - 1 == #keys then
		index = 0
		keys = shuffle(keys)
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)
end