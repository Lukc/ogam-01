
class
	new: (arg) =>
		arg = arg or {}

		@callbacks = {}
		@children = {}

		print self

		-- Requested values. Consider them to be public.
		@x, @y, @w, @h = arg.x or 0, arg.y or 0, arg.w or 0, arg.h or 0

		-- Computed values. Consider them to be protected.
		@rectangle =
			x: @x
			y: @y
			w: @w
			h: @h

		for key, value in pairs arg
			if type(key) != "function"
				continue

			@callbacks[key] = value

		for i = 1, #arg
			table.insert @children, arg[i]

			arg[i].parent = self

	getActiveChildren: =>
		@children

	isWithin: (x, y) =>
		return x >= @x and y >= @y and x < @x + @w and y < @y + @h

	fireEvent: (event, ...) =>
		callback = @callbacks[event]

		if callback
			callback @, ...

		for child in *@\getActiveChildren!
			child[event] child, ...

	draw: =>
		@\fireEvent "draw"

	update: (dt) =>
		if @parent
			@rectangle.x = @x + @parent.rectangle.x
			@rectangle.y = @y + @parent.rectangle.y

		@\fireEvent "update", dt

	keypressed: (key, scancode, isRepeat) =>
		@\fireEvent "keypressed", key, scancode, isRepeat

	keyreleased: (key, scancode, isRepeat) =>
		@\fireEvent "keyreleased", key, scancode, isRepeat

	mousepressed: (x, y, button, isTouch) =>
		@\fireEvent "mousepressed", x, y, button, isTouch

	mousereleased: (x, y, button, isTouch) =>
		@\fireEvent "mousereleased", x, y, button, isTouch

	__tostring: =>
		"@[Button: #{@x}, #{@y}, #{@w}, #{@h}]"


