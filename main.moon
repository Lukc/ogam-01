
PageStack = require "pagestack"

Page = require "page"
Button = require "button"
Column = require "column"

GameArea = require "gamearea"

local pagestack

love.load = ->
	pagestack = PageStack!

	pagestack\push Page {
		draw: =>
			love.graphics.setColor 255, 127, 200
			love.graphics.print "Nyaa~", 0, 0

		keypressed: (k) =>
			print k

		Column {
			y: 40

			update: (dt) =>
				@x = (@parent.rectangle.w - @rectangle.w) / 2

			Button {
				x: 10
				y: 10
				w: 300
				h: 42
				label: "New Game"

				clicked: =>
					pagestack\push GameArea!
			}

			Button {
				x: 10
				y: 62
				w: 300
				h: 42
				label: "Exit"

				clicked: =>
					pagestack\pop!
			}
		}
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

love.touchpressed = (id, x, y, dx, dy, pressure) ->
	pagestack\touchpressed id, x, y, dx, dy, pressure

love.touchreleased = (id, x, y, dx, dy, pressure) ->
	pagestack\touchreleased id, x, y, dx, dy, pressure

