
class
	new: (arg) =>
		arg = arg or {}

		@callbacks = {}
		@children = {}

		-- Requested values. Consider them to be public.
		@x, @y, @w, @h = arg.x, arg.y, arg.w, arg.h

		-- Computed values. Consider them to be protected.
		@rectangle = {
			x: @x or 0
			y: @y or 0
			w: @w or 0
			h: @h or 0
		}

		for key, value in pairs arg
			-- FIXME: Identify event keys or forbid non-events.
			if type(value) != "function"
				continue

			@callbacks[key] = value

		for i = 1, #arg
			table.insert @children, arg[i]

			arg[i].parent = self

	getActiveChildren: =>
		@children

	isWithin: (X, Y) =>
		{:x, :y, :w, :h} = @rectangle

		return X >= x and Y >= y and X < x + w and Y < y + h

	fireEvent: (event, ...) =>
		callback = @callbacks[event]

		if callback
			callback @, ...

		for child in *@\getActiveChildren!
			child[event] child, ...

	draw: =>
		@\fireEvent "draw"

	update: (dt) =>
		for child in *@\getActiveChildren!
			child.rectangle.x = @rectangle.x + (child.x or 0)
			child.rectangle.y = @rectangle.y + (child.y or 0)

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
		"@[Widget: #{@rectangle.x}, #{@rectangle.y}, #{@rectangle.w}, #{@rectangle.h}]"


