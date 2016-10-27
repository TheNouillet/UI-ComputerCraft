os.loadAPI("UI")

fb = UI.Widget:new()
fb.label = "Forward"
fb.key = 200
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
vp.handleOtherEvents = function (self, event, par1, par2, par3, par4, par5)
  if event == "key" and par1 == 30 then
    fb.label = "Changed !"
  end
end

app = UI.App:new()
app:setViewport(vp)
app:run()