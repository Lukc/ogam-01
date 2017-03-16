
class
	new: (arg) =>
		@callbacks = {}
		@children = {}

		for key, value in pairs arg
			if type(key) != "function"
				continue

			@callbacks[key] = value

		for i = 1, #arg
			table.insert @children, arg[i]

	isWithin: (x, y) =>
		return x >= @x and y >= @y and x < @x + @w and y < @y + @h

	fireEvent: (event, ...) =>
		callback = @callbacks[event]

		if callback
			callback @, ...

		for child in *@children
			child[event] child, ...

	draw: =>
		@\fireEvent "draw"

	update: (dt) =>
		@\fireEvent "update"

	keypressed: (key, scancode, isRepeat) =>
		@\fireEvent "keypressed", key, scancode, isRepeat

	keyreleased: (key, scancode, isRepeat) =>
		@\fireEvent "keyreleased", key, scancode, isRepeat

	mousepressed: (x, y, button, isTouch) =>
		@\fireEvent "mousepressed", x, y, button, isTouch

	mousereleased: (x, y, button, isTouch) =>
		@\fireEvent "mousereleased", x, y, button, isTouch

