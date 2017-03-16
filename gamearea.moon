
Widget = require "widget"

class extends Widget
	draw: =>
		{:x, :y, :w, :h} = @rectangle

		love.graphics.setColor 255, 0, 0
		love.graphics.rectangle "line", x, y, w, h

		love.graphics.print "This is all a placeholder.", x + 10, y + 10

	__tostring: =>
		"@[GameArea]"

