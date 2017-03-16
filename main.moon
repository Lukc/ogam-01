
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
					pagestack\push Page {
						GameArea {
							w: 600
							h: 400
						}
						Button {
							x: 620
							y: 20
							w: 160
							h: 40

							label: "Go back"

							clicked: =>
								pagestack\pop!
						}
					}
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

	pagestack\registerTriggers love

love.draw = ->
	pagestack\draw!

love.update = (dt) ->
	pagestack\update dt

