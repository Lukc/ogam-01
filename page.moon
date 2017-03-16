
{:getMode} = love.window

Widget = require "widget"

class extends Widget
	update: (dt) =>
		w, h = getMode!

		@rectangle =
			x: 0
			y: 0
			w: w
			h: h

		super\update dt

	__tostring: =>
		"@[Page: #{#@children} children]"

