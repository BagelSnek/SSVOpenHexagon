u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("utils.lua")
u_execScript("alternativepatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

local flip = 1

-- rollingShutter: makes a straight line at a given side of length amount of walls that increase in curve
function rollingShutter(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, length)
	for i = 0, length - 1 do
		wallHMCurveAcc(mSide, mCurve * i / 5, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		t_wait(getPerfectDelay(THICKNESS) * 2)
	end
end

-- rollingShutters: makes beams amount straight lines from mSide with length amount of walls that increase in curve
function rollingShutters(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, beams, length)
	for i = 0, length - 1 do
		for i2 = 0, beams - 1 do
			wallHMCurveAcc(mSide + (l_getSides() / beams) * i2, mCurve * i / (5 * beams), mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		end

		t_wait(getPerfectDelay(THICKNESS) * 2)
	end
end

-- stackedWall: creates mAmount of walls that increase in curve at the same side
function stackedWall(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, mAmount)
	for i = 0, mAmount - 1 do
		wallHMCurveAcc(mSide, mCurve * i / 5, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end

	t_wait(getPerfectDelay(THICKNESS) * 2)
end

-- alternatingCurveCage: creates a ring with a curve and varying distance from center
function alternatingCurveCage(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	for i = 0, l_getSides() - 1 do
		wallHMCurveAcc(mSide + i * flip, mCurve * flip, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		flip = -flip
		t_wait(getPerfectDelay(THICKNESS))
	end

	t_wait(getPerfectDelay(THICKNESS))
end

-- fracWallRing: creates a ring of walls randomly with sides/frac
function fracWallRing(frac)
	walls = randNRArray(math.floor(l_getSides() / frac), 0, l_getSides() - 1)
	for i = 1, #walls do
		cWall(walls[i])
	end

	t_wait(getPerfectDelay(THICKNESS) * 7.5)
end

-- fracAccWallRing: fracWallRing with functionallity of wallHMCurveAcc
function fracAccWallRing(frac, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	walls = randNRArray(math.floor(l_getSides() / frac), 0, l_getSides() - 1)
	for i = 1, #walls do
		wallHMCurveAcc(walls[i], mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end

	t_wait(getPerfectDelay(THICKNESS) * 7.5)
end

-- blitzBarrage: randomly creates mAmount of walls with probabilities for type
function blitzBarrage(mAmount, blitzDM, curveProb, fallProb)
	for i = 0, mAmount - 1 do
		side = bRandom(0, l_getSides() - 1)
		blitzAcc = bRandom(1, 20) / 20.0
		if blitzAcc > curveProb + fallProb then
			cWall(side)
			flip = -flip
		elseif blitzAcc > fallProb then
			wallHMCurveAcc(side, blitzDM * 3 * flip, blitzDM / 20.0 * flip, blitzDM / -2.0, blitzDM / 2.0, false)
		else
			w_wallAdj(side, THICKNESS, 1.2 * blitzDM)
		end
		t_wait(getPerfectDelay(THICKNESS) * ((bRandom(0, 6) + 7) / 10))
	end

	t_wait(getPerfectDelay(THICKNESS) * 7.5)
end

-- blitzRing: creates a ring where certain walls curve based on blitzDM and accProb
function blitzRing(wallGaps, blitzDM, curveProb, fallProb)
	walls = randNRArray(l_getSides() - wallGaps, 0, l_getSides() - 1)
	for i = 1, #walls do
		blitzAcc = bRandom(1, 20) / 20.0
		if blitzAcc > curveProb + fallProb then
			cWall(walls[i])
			flip = -flip
		elseif blitzAcc > fallProb then
			wallHMCurveAcc(walls[i], blitzDM * 3 * flip, blitzDM / 20.0 * flip, blitzDM / -2.0, blitzDM / 2.0, false)
		else
			w_wallAdj(walls[i], THICKNESS, 1.2 * blitzDM)
		end
	end

	t_wait(getPerfectDelay(THICKNESS) * 7.5)
end

-- ripple: makes a wall fall, faster adjacent walls fall after
function ripple(mSide, mAdj, mAdjSpeed)
	w_wallAdj(mSide, THICKNESS, mAdjSpeed)
	for i = 1, mAdj do
		t_wait(getPerfectDelay(THICKNESS) * 3)
		w_wallAdj(mSide + i, THICKNESS, mAdjSpeed + i)
		w_wallAdj(mSide - i, THICKNESS, mAdjSpeed + i)
	end

	t_wait(getPerfectDelay(THICKNESS) * 5)
end