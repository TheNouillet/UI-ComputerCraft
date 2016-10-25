function halfTurn (b)
	if b then
		turtle.turnLeft()
		while not(turtle.forward()) do
			turtle.dig()
		end
		turtle.turnLeft()
	else
		turtle.turnRight()
		while not(turtle.forward()) do
			turtle.dig()
		end
		turtle.turnRight()
	end
end

function fuelCheck(x, y)
	local fuel = turtle.getFuelLevel()
	local cost = (x*y) + x + y
	return fuel >= cost
end

-- Getting arguments
local tArgs = { ... }
if #tArgs ~= 2 then
	print("Usage : farm <width> <depth>")
	return
end

local xMax = tonumber(tArgs[1])
local yMax = tonumber(tArgs[2])
local currentX = 0
local currentY = 0
local isEven = false

if not(fuelCheck(xMax, yMax)) then
	print("Not enough fuel")
	return
end

-- Farming routine
print("Farming ...")
while currentX < xMax do
	while currentY < yMax do
		
		turtle.digDown()
		turtle.placeDown()
		currentY = currentY + 1
		
		-- If there is still to farm in the same column, move forward
		if currentY < yMax then
			while not(turtle.forward()) do
				turtle.dig()
			end
		end
		
	end
	
	print("Column done")
	currentX = currentX + 1
	if currentX < xMax then
		halfTurn(isEven)
		isEven = not(isEven)
	end
	currentY = 0
end

-- Return routine
print("Farming done, returning ...")
currentX = 1
currentY = 1
if not(isEven) then
	turtle.turnLeft()
	turtle.turnLeft()
	while currentY < yMax do
		while not(turtle.forward()) do
			turtle.dig()
		end
		currentY = currentY + 1
	end
end
turtle.turnRight()
while currentX < xMax do
	while not(turtle.forward()) do
			turtle.dig()
	end
	currentX = currentX + 1
end

-- Placing down ressources
for i=2, 16 do
	turtle.select(i)
	turtle.drop()
end
turtle.select(1)
turtle.turnRight()
print("Done !")

