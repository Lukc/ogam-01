
{:getMode} = love.window

Widget = require "widget"

class extends Widget
	update: (dt) =>
		@x, @y = 0, 0
		@w, @h = getMode!

		super\update dt

	__tostring: =>
		"@[Page: #{#@children} children]"

