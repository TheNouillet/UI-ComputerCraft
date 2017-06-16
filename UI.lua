-- The Widget class provide an easy way to draw a simple text-Widget and handle events on it.
Widget = {
            x = 1,
            y = 1,
            key = 0,
            label = "Label",
            fontColor = 1,
            backgroundColor = 32768,
            parentViewport = nil
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
-- Method called each time there is an event
function Widget:tick()

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
end
-- Handle events for this Widget
function Widget:handleEvents(event, parameters)
    if event == "mouse_click" then
        if self:isOnWidget(parameters[2], parameters[3]) then
            self:onClick()
        end
    elseif event == "key" then
        if self.key == parameters[1] then
            self:onClick()
        end
    end
end

-- The TextInput class is a Widget which can accept text input by the user
TextInput = Widget:new()
-- This method remove the label, keeping the TextInput background
function TextInput:clearLabel()
    term.setCursorPos(self.x, self.y)
    term.setBackgroundColor(self.backgroundColor)
    for i = 1, #self.label do
        term.write(" ")
    end
end
-- The TextInput class redefine the onClick method to handle user input
function TextInput:onClick()
    -- We clear the current label to make place for user input
    self:clearLabel()
    term.setTextColor(self.fontColor)
    term.setCursorPos(self.x, self.y)
    -- We set the label to user input if not empty, otherwise we restore the previous label
    str = read()
    if str ~= "" then
        self.label = str
    end
end

-- The Viewport class is a container of Widgets, which can handle events and rendering.
Viewport = {
                widgets = {},
                x = 1,
                y = 1,
                width = 1, 
                height = 1,
                backgroundColor = 32768,
                parentApp = nil
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
    if widget ~= nil then
        widget.parentViewport = self
        table.insert(self.widgets, widget)
    end
end
-- Remove widget from the viewport
function Viewport:removeWidget(widget)
    for i = 1, #self.widgets do
        if widget == self.widgets[i] then
            widget.parentViewport = nil
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
    
    -- Default values
    term.setTextColor(1)
    term.setBackgroundColor(32768)
end
-- Handle events such as mouse click
function Viewport:handleEvents()
    parameters = {}
    event, parameters[1], parameters[2], parameters[3], parameters[4], parameters[5] = os.pullEvent()
    for i = 1, #self.widgets do
        self.widgets[i]:handleEvents(event, parameters)
    end
    self:handleOtherEvents(event, parameters)
end
-- Call the tick() method of all widgets
function Viewport:doTicks()
    for i = 1, #self.widgets do
        self.widgets[i]:tick()
    end
end
-- This method is called after handling events, and aims to extend the framework events handling
function Viewport:handleOtherEvents(event, parameters)
    
end
-- This method is called after event hendling and before widgets ticks
function Viewport:beforeTicks()
    
end
-- This method is called after widgets ticks and before widgets drawing
function Viewport:afterTicks()
    
end

-- The App class knows the active Viewport and handle the life cycle of a program
App = {
            activeViewport = nil,
            isDone = false
      }
-- Create a new instance of program
function App:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
-- Set the current active Viewport
function App:setViewport(vp)
    self.activeViewport = vp
    if self.activeViewport ~= nil then
        self.activeViewport.parentApp = self
    end
end
-- This method is the main life cycle of the program
function App:run()
    if self.activeViewport ~= nil then
        -- Life cycle
        self.activeViewport:draw()
        while not(self.isDone) do
            self.activeViewport:handleEvents()
            self.activeViewport:beforeTicks()
            self.activeViewport:doTicks()
            self.activeViewport:afterTicks()
            self.activeViewport:draw()
        end
        -- Clearing terminal
        self:onAppExit()
        term.clear()
        term.setCursorPos(1,1)
    end
end
-- This method end the app
function App:exitApp()
    self.isDone = true
end
-- Implement this callback if you want to do particular actions before shutting down the program
function App:onAppExit()
    
end