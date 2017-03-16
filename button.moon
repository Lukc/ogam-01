
{:rectangle, :setColor} = love.graphics

text = love.graphics.print

getMousePosition = love.mouse.getPosition

Widget = require "widget"

class extends Widget
	new: (arg) =>
		super.__init @, arg

		-- Text to display.
		@label = arg.label

		@pressed =
			mouse: false

		@callbacks.clicked = arg.clicked

	draw: =>
		super\draw!

		mx, my = getMousePosition!

		if @\isWithin mx, my
			if @pressed
				setColor 255, 128, 128
			else
				setColor 255, 255, 255
		else
			setColor 128, 128, 128

		{:x, :y, :w, :h} = @rectangle

		rectangle "line", x, y, w, h
		text @label or "", x, y

	mousepressed: (x, y, button, isRepeat) =>
		if @\isWithin x, y
			if button == 1
				@pressed.mouse = true

	mousereleased: (x, y, button, isRepeat) =>
		if @pressed.mouse
			if button == 1
				if @\isWithin x, y
					@\fireEvent "clicked"

				@pressed.mouse = false

	touchpressed: (id, x, y, ...) =>
		print "pressed", id, x, y
		if @\isWithin x, y
			@pressed[id] = true

	touchreleased: (id, x, y, ...) =>
		print "released", id, x, y
		if @pressed[id]
			if @\isWithin x, y
				@\fireEvent "clicked"

			@pressed[id] = nil

	__tostring: =>
		"@[Button: \"#{@label}\"]"

