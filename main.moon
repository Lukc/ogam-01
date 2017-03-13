
PageStack = require "pagestack"

Page = require "page"

local pagestack

love.load = ->
	pagestack = PageStack!

	pagestack\push Page
		draw: =>
			love.graphics.print "Nyaa~", 0, 0

		keypressed: (k) =>
			print k

love.draw = ->
	pagestack\draw!

love.update = (dt) ->
	pagestack\update dt

love.keypressed = (k, r, u) ->
	pagestack\keypressed k, r, u

