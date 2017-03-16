
PageStack = require "pagestack"

Page = require "page"
Button = require "button"

GameArea = require "gamearea"

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
			label: "New Game"

			clicked: =>
				pagestack\push GameArea!

		Button
			x: 10
			y: 62
			w: 300
			h: 42
			label: "Exit"

			clicked: =>
				pagestack\pop!
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

