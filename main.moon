
PageStack = require "pagestack"

Page = require "page"
Button = require "button"

local pagestack

love.load = ->
	pagestack = PageStack!

	pagestack\push Page {
		draw: =>
			love.graphics.print "Nyaa~", 0, 0

		keypressed: (k) =>
			print k

		Button
			x: 10
			y: 10
			w: 300
			h: 42
			label: "Click me!"

			clicked: =>
				print "Clickity click."
	}

love.draw = ->
	pagestack\draw!

love.update = (dt) ->
	pagestack\update dt

love.keypressed = (k, sc, ir) ->
	pagestack\keypressed k, sc, ir

love.keyreleased = (k, sc, ir) ->
	pagestack\keyreleased k, sc, ir

love.mousepressed = (x, y, b, it) ->
	pagestack\mousepressed x, y, b, it

love.mousereleased = (x, y, b, it) ->
	pagestack\mousereleased x, y, b, it

