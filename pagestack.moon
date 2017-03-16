
class
	new: =>
		@stack = {}

	push: (page, ...) =>
		with last = @\last!
			if last and .pause
				\pause!

		table.insert @stack, page

		with @\last!
			if .load
				\load ...

	pop: =>
		with @\last!
			if .exit
				\exit!

		table.remove @stack

		with @\resume!
			if .resume
				\resume!

	last: =>
		@stack[#@stack]

	draw: =>
		with @\last!
			if .draw
				\draw!

	update: (dt) =>
		with @\last!
			if .update
				\update dt

	keypressed: (k, r, u) =>
		with @\last!
			if .keypressed
				\keypressed k, r, u

	keyreleased: (k, r, u) =>
		with @\last!
			if .keyreleased
				\keyreleased k, r, u

	mousepressed: (k, r, u) =>
		with @\last!
			if .mousepressed
				\mousepressed k, r, u

	mousereleased: (k, r, u) =>
		with @\last!
			if .mousereleased
				\mousereleased k, r, u

