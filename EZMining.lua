os.loadAPI("UI")

refuelButton = UI.Widget:new()
refuelButton.x = 10
refuelButton.y = 11
refuelButton.label = "Refuel"
refuelButton.backgroundColor = 2048
refuelButton.fontColor = 1
refuelButton.onClick = function (self)
	turtle.refuel()
end

fuelText = UI.Widget:new()
fuelText.x = 10
fuelText.y = 12
fuelText.label = "Fuel level : "

fuelLevel = UI.Widget:new()
fuelLevel.x = 22
fuelLevel.y = 12
fuelLevel.label = turtle.getFuelLevel()
fuelLevel.tick = function (self)
	self.label = turtle.getFuelLevel()
end

forwardButton = UI.Widget:new()
forwardButton.x = 7
forwardButton.y = 5
forwardButton.label = "^"
forwardButton.backgroundColor = 2048
forwardButton.fontColor = 1
forwardButton.onClick = function (self)
	turtle.forward()
end

leftButton = UI.Widget:new()
leftButton.x = 5
leftButton.y = 7
leftButton.label = "<"
leftButton.backgroundColor = 2048
leftButton.fontColor = 1
leftButton.onClick = function (self)
	turtle.turnLeft()
end

backButton = UI.Widget:new()
backButton.x = 7
backButton.y = 9
backButton.label = "v"
backButton.backgroundColor = 2048
backButton.fontColor = 1
backButton.onClick = function (self)
	turtle.back()
end

rightButton = UI.Widget:new()
rightButton.x = 9
rightButton.y = 7
rightButton.label = ">"
rightButton.backgroundColor = 2048
rightButton.fontColor = 1
rightButton.onClick = function (self)
	turtle.turnRight()
end

upButton = UI.Widget:new()
upButton.x = 5
upButton.y = 5
upButton.label = "U"
upButton.backgroundColor = 2048
upButton.fontColor = 1
upButton.onClick = function (self)
	turtle.up()
end

downButton = UI.Widget:new()
downButton.x = 5
downButton.y = 9
downButton.label = "D"
downButton.backgroundColor = 2048
downButton.fontColor = 1
downButton.onClick = function (self)
	turtle.down()
end

miningButton = UI.Widget:new()
miningButton.x = 12
miningButton.y = 7
miningButton.label = "Dig tunnel"
miningButton.backgroundColor = 2048
miningButton.fontColor = 1
miningButton.onClick = function (self)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("tunnel")
	os.sleep(3)
end

vp = UI.Viewport:new()
vp:addWidget(forwardButton)
vp:addWidget(leftButton)
vp:addWidget(downButton)
vp:addWidget(rightButton)
vp:addWidget(backButton)
vp:addWidget(upButton)
vp:addWidget(refuelButton)
vp:addWidget(fuelText)
vp:addWidget(fuelLevel)
vp:addWidget(miningButton)

app = UI.App:new()
app:setViewport(vp)
app:run()

