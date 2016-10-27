os.loadAPI("UI")

farmButton = UI.Widget:new()
farmButton.x = 12
farmButton.y = 6
farmButton.farmWidth = 1
farmButton.farmDepth = 1
farmButton.label = "Lancer le farm"
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
refuelButton.label = "Remplir de carburant"
refuelButton.backgroundColor = 2048
refuelButton.fontColor = 1
refuelButton.onClick = function (self)
	turtle.refuel()
end

fuelText = UI.Widget:new()
fuelText.x = 10
fuelText.y = 10
fuelText.label = "Carburant : "

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

