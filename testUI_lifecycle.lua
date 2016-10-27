os.loadAPI("UI")
 
fb = UI.Widget:new()
fb.label = "Forward"
fb.onClick = function (self)
  turtle.forward()
end
 
fuel = UI.Widget:new()
fuel.y = 2
fuel.label = turtle.getFuelLevel()
fuel.tick = function (self)
  self.label = turtle.getFuelLevel()
end
 
eb = UI.Widget:new()
eb.y = 3
eb.label = "Exit"
eb.onClick = function (self)
  self.parentViewport.parentApp:exitApp()
end
 
vp = UI.Viewport:new()
vp:addWidget(fb)
vp:addWidget(fuel)
vp:addWidget(eb)
 
app = UI.App:new()
app:setViewport(vp)
app:run()