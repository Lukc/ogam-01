
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
	}

love.draw = ->
	pagestack\draw!

love.update = (dt) ->
	pagestack\update dt

love.keypressed = (k, r, u) ->
	pagestack\keypressed k, r, u

