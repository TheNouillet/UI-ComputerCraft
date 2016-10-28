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

ti = UI.TextInput:new()
ti.y = 4
ti.backgroundColor = 8
ti.fontColor = 32768

cb = UI.Widget:new()
cb.y = 5
cb.label = "Change now"
cb.onClick = function (self)
  fb.label = ti.label
end

vp = UI.Viewport:new()
vp:addWidget(fb)
vp:addWidget(fuel)
vp:addWidget(eb)
vp:addWidget(ti)
vp:addWidget(cb)
vp.handleOtherEvents = function (self, event, pars)
  if event == "key" and pars[1] == 30 then
    fb.label = "Changed !"
  end
end

app = UI.App:new()
app:setViewport(vp)
app:run()