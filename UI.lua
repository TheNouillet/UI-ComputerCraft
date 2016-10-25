-- The Widget class provide an easy way to draw a simple text-Widget and handle events on it.
Widget = {
			x = 1,
			y = 1,
			key = 0,
			label = "Label",
			fontColor = 1,
			backgroundColor = 32768
         }
-- Create a new instance of Widget.
function Widget:new (o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end
-- Method called when clicked on the Widget.
function Widget:onClick ()
	
end
-- Return true if x and y coordinates are within Widget boundaries. Else false.
function Widget:isOnWidget(posX, posY)
	return (posX >= self.x and posX < self.x + string.len(self.label)) and posY == self.y
end
-- Draw the Widget on the viewport.
function Widget:draw ()
	--Drawing Widget
	term.setCursorPos(self.x, self.y)
	term.setTextColor(self.fontColor)
	term.setBackgroundColor(self.backgroundColor)
	term.write(self.label)
	
	--Default values
	term.setTextColor(1)
	term.setBackgroundColor(32768)
end

-- The Viewport class is a container of Widgets, which can handle events and rendering.
Viewport = {
				widgets = {},
				x = 1,
				y = 1,
				width = 1, 
				height = 1,
				backgroundColor = 32768
		   }
-- Create a new instance of Viewport.
function Viewport:new (o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	
	self.width, self.height = term.getSize()
	
	return o
end
-- Add widget to the viewport
function Viewport:addWidget(widget)
	table.insert(self.widgets, widget)
end
-- Remove widget from the viewport
function Viewport:removeWidget(widget)
	for i = 1, #self.widgets do
		if widget == self.widgets[i] then
			table.remove(self.widgets, i)
		end
	end
end
-- Clear the drawing area, then draw all widgets within the viewport
function Viewport:draw()
	-- Clear the drawing area
	term.setBackgroundColor(self.backgroundColor)
	for i = self.x, self.width do
		for j = self.y, self.height do
			term.setCursorPos(i, j)
			term.write(" ")
		end
	end
	
	-- Draw all widgets
	for i = 1, #self.widgets do
		self.widgets[i]:draw()
	end
end
-- Handle events such as mouse click
function Viewport:handleEvents()
	event, button, posX, posY = os.pullEvent()
	if event == "mouse_click" then
		for i = 1, #self.widgets do
			if self.widgets[i]:isOnWidget(posX, posY) then
				self.widgets[i]:onClick()
			end
		end
	end
end