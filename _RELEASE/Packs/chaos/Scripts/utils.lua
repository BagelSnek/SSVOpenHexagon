-- initialize random seed
math.randomseed(os.time())

-- bRandom: gives a better random number that doesn't rely on os.time()
function bRandom(minVal, maxVal)
	if minVal == maxVal then return minVal end
	math.randomseed(math.random() * 10 ^ 7)
	return math.random(minVal, maxVal)
end

-- shuffle: shuffles an array
function shuffle(t)
	local iterations = #t
	local j
	for i = iterations, 2, -1 do
			j = math.random(i)
			t[i], t[j] = t[j], t[i]
	end
	
	return t
end

-- clamp: clamps a number between two values
function clamp(input, min_val, max_val)
	if input < min_val then
		input = min_val
	elseif input > max_val then
		input = max_val
	end

	return input
end

-- valInArray: determines if val is in a given array
function valInArray(val, array)
	inArray = false
    for i = 1, #array do
        if array[i] == val then
            inArray = true
        end
    end

    return inArray
end

-- randNRArray: returns an array of a given length with numbers between minVal and maxVal with no repeating numbers
function randNRArray(length, minVal, maxVal)
	sides = {n = length}
	for i = 1, length do
		repeat
			arrayIn = math.random(minVal, maxVal)
		until valInArray(arrayIn, sides) == false
		sides[i] = arrayIn
	end

	return sides
end