os.loadAPI("UI")

farmButton = UI.Widget:new()
farmButton.x = 12
farmButton.y = 6
farmButton.farmWidth = 1
farmButton.farmDepth = 1
farmButton.label = "Launch farming"
farmButton.backgroundColor = 2048
farmButton.fontColor = 1
farmButton.onClick = function (self)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("farm", self.farmWidth, self.farmDepth)
	os.sleep(3)
end

refuelButton = UI.Widget:new()
refuelButton.x = 10
refuelButton.y = 8
refuelButton.label = "Refuel"
refuelButton.backgroundColor = 2048
refuelButton.fontColor = 1
refuelButton.onClick = function (self)
	turtle.refuel()
end

fuelText = UI.Widget:new()
fuelText.x = 10
fuelText.y = 10
fuelText.label = "Fuel level : "

fuelLevel = UI.Widget:new()
fuelLevel.x = 22
fuelLevel.y = 10
fuelLevel.label = turtle.getFuelLevel()
fuelLevel.tick = function(self)
	self.label = turtle.getFuelLevel()
end

vp = UI.Viewport:new()
vp:addWidget(farmButton)
vp:addWidget(refuelButton)
vp:addWidget(fuelText)
vp:addWidget(fuelLevel)

app = UI.App:new()
app:setViewport(vp)
app:run()

