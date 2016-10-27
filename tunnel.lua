function doMining ()
	while not(turtle.forward()) do
		turtle.dig()
	end
	turtle.turnLeft()
	while turtle.detect() do
		turtle.dig()
	end
	while not(turtle.up()) do
		turtle.digUp()
	end
	while turtle.detect() do
		turtle.dig()
	end
	turtle.turnRight()
	turtle.turnRight()
	while turtle.detect() do
		turtle.dig()
	end
	while not(turtle.down()) do
		turtle.digDown()
	end
	while turtle.detect() do
		turtle.dig()
	end
	turtle.turnLeft()
end

function fuelCheck(l)
	local fuel = turtle.getFuelLevel()
	local cost = (l * 3) + l + 1
	return fuel >= cost
end

-- Getting arguments
local tArgs = { ... }
local currentLength = 0
local maxLength = 0
if #tArgs == 0 then
	print("Tunnel length ?")
	maxLength = tonumber(read())
elseif #tArgs ~= 1 then
	print("Usage : tunnel <length>")
	return
else
	maxLength = tonumber(tArgs[1])
end


local torchLength = 8
local currentTorchLength = 0

if not(fuelCheck(maxLength)) then
	print("Not enough fuel")
	return
end

-- Mining routine
print("Mining ...")
while currentLength < maxLength do
	
	doMining()
	
	-- Torch ?
	if currentTorchLength < torchLength then
		currentTorchLength = currentTorchLength + 1
	else
		turtle.turnLeft()
		turtle.turnLeft()
		turtle.place()
		turtle.turnRight()
		turtle.turnRight()
		currentTorchLength = 0
	end
	
	currentLength = currentLength + 1
end

-- Half turn
turtle.turnLeft()
while not(turtle.forward()) do
	turtle.dig()
end
turtle.turnLeft()

--Return routine
currentLength = 0
while currentLength < maxLength do
	while not(turtle.forward()) do
		turtle.dig()
	end
	currentLength = currentLength + 1
end
print("Done !")