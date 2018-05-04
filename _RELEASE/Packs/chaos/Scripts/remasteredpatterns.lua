u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("utils.lua")
u_execScript("alternativepatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

local flip = 1

--rollingShutter: makes a straight line at a given side of length amount of walls that increase in curve
function rollingShutter(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, length)
	for i = 0, length - 1 do
		wallHMCurveAcc(mSide, mCurve * i / 5, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS / 1.5)))
	end
end

--rollingShutters: makes beams amount straight lines from mSide with length amount of walls that increase in curve
function rollingShutters(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, beams, length)
	for i = 0, length - 1 do
		for i2 = 0, beams - 1 do
			wallHMCurveAcc(mSide + (l_getSides() / beams) * i2, mCurve * i / (5 * beams), mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		end

		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS / 1.5)))
	end
end

--stackedWall: creates mAmount of walls that increase in curve at the same side
function stackedWall(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, mAmount)
	for i = 0, mAmount - 1 do
		wallHMCurveAcc(mSide, mCurve * i / 5, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end

	t_wait(getPerfectDelay(getPerfectThickness(THICKNESS * 2)))
end

--alternatingCurveCage: creates a ring with a curve and varying distance from center
function alternatingCurveCage(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	for i = 0, l_getSides() - 1 do
		wallHMCurveAcc(mSide + i * flip, mCurve * flip, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		flip = -flip
		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)))
	end

	flip = 1
	t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)))
end

--fracWallRing: creates a ring of walls randomly with sides/frac
function fracWallRing(frac)
	walls = randNRArray(l_getSides() / frac, 0, l_getSides() - 1)
	for i = 1, #walls do
		cWall(walls[i])
	end

	t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)) * 5)
end

--fracAccWallRing: fracWallRing with functionallity of wallHMCurveAcc
function fracAccWallRing(frac, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	walls = randNRArray(l_getSides() / frac, 0, l_getSides() - 1)
	for i = 1, #walls do
		wallHMCurveAcc(walls[i], mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end

	t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)) * 5)
end