
Widget = require "widget"

class extends Widget
	new: =>
		super.__init @, {}

	getLast: =>
		@children[#@children]

	getActiveChildren: =>
		{ @\getLast! }

	push: (page, ...) =>
		with last = @\getLast!
			if last and .pause
				\pause!

		table.insert @children, page

		with @\getLast!
			if .load
				\load ...

	pop: =>
		with @\getLast!
			if .exit
				\exit!

		table.remove @children

		if #@children == 0
			return love.event.quit!

		with @\getLast!
			if .resume
				\resume!

	__tostring: =>
		"@[PageStack: #{#@children} children]"


