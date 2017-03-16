
{:rectangle, :setColor} = love.graphics

Widget = require "widget"

class extends Widget
	new: (arg) =>
		super.__init @, arg

		@padding = arg.padding or 10
		@spacing = arg.spacing or 10

	draw: =>
		{:x, :y, :w, :h} = @rectangle

		setColor 128, 128, 128
		rectangle "line", @x, @y, @w, @h

		super\draw!

	update: (dt) =>
		print "Updating #{self}."
		super\update dt

		w = 0
		h = @padding
		for child in *@\getActiveChildren!
			child.y = h

			w = math.max w, child.rectangle.w
			h += child.rectangle.h
			h += @spacing

		w = w + @padding * 2
		h -= @spacing += @padding

		unless @h
			@rectangle.h = h
		unless @w
			@rectangle.w = w

	__tostring: =>
		"@[Column: #{@x}, #{@y}, #{@w}, #{@h}, \"#{@label}\"]"

