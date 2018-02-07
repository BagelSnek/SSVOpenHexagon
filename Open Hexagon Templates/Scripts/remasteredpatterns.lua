u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("utils.lua")
u_execScript("alternativepatterns.lua")
u_execScript("nextpatterns.lua")
u_execScript("evolutionpatterns.lua")

flip = 1

function rollingShutter(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, length)
	for i = 0, length - 1 do
		wallHMCurveAcc(mSide, mCurve * i / 5, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS/1.5)))
	end
end

function rollingShutters(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, beams, length)
	for i = 0, length - 1 do
		for i2 = 0, beams - 1 do
			wallHMCurveAcc(mSide + (l_getSides() / beams) * i2, mCurve * i / (5 * beams), mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		end

		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS/1.5)))
	end
end

function stackedWall(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong, mAmount)
	for i = 0, mAmount - 1 do
		wallHMCurveAcc(mSide, mCurve * i / 5, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	end

	t_wait(getPerfectDelay(getPerfectThickness(THICKNESS * 2)))
end

function alternatingCurveCage(mSide, mCurve, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
	for i = 0, l_getSides() - 1 do
		wallHMCurveAcc(mSide + i * flip, mCurve * flip, mCurveAcc, mCurveMin, mCurveMax, mCurvePingPong)
		flip = -flip
		t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)))
	end

	flip = 1
	t_wait(getPerfectDelay(getPerfectThickness(THICKNESS)))
end