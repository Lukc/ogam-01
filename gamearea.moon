
Widget = require "widget"

class extends Widget
	new: (arg) =>
		Widget.__init @, arg

		unless arg.w
			@w = 600
		unless arg.h
			@h = 400

	draw: =>
		{:x, :y, :w, :h} = @rectangle

		love.graphics.setColor 255, 0, 0
		love.graphics.rectangle "line", x, y, w, h

		love.graphics.print "This is all a placeholder.", x + 10, y + 10

	__tostring: =>
		"@[GameArea]"

