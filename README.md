## UI for Computer Craft
This is an Object-Oriented framework for the Computer Craft mod in Minecraft. With it,
you can create graphical widgets for Lua programs.

## Usage
You can look for code example in EZ*.lua and testUI_lifecycle.lua files.
# Widget
First, you have to configure your widgets. You can do so by changing graphical values, such as X and Y positions (which are absolute positions), the widget label, and the font and background colors.
Then, you can define two callback methods, onClick() and tick(). These callbacks have one parameter, which is "self" (the object, according to the Object concept in Lua).
# Viewport
After configuring your widgets, you have to create at least one Viewport. By default, a Viewport is taking the entire terminal, but you can configure it to take the terminal space you want.
The Viewport itself, also have two callback methods, beforeTick() and afterTick(), also with the same "self" parameter.
# App
Finally, the App represent the life cycle of your program. You can define an active Viewport, and change it on the go within your program.
