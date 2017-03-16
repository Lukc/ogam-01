
{:rectangle, :setColor} = love.graphics

text = love.graphics.print

getMousePosition = love.mouse.getPosition

Widget = require "widget"

class extends Widget
	new: (arg) =>
		super @

		@x = arg.x
		@y = arg.y
		@w = arg.w
		@h = arg.h

		-- Text to display.
		@label = arg.label

	draw: =>
		super\draw!

		mx, my = getMousePosition!

		if @\isWithin mx, my
			setColor 255, 255, 255
		else
			setColor 128, 128, 128

		rectangle "line", @x, @y, @w, @h
		text @label or "", @x, @y

	__tostring: =>
		"@[Rectangle: #{@x}, #{@y}, #{@w}, #{@h}, \"#{@label}\"]"

