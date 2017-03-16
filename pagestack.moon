
Widget = require "widget"

class extends Widget
	new: =>
		super.__init @, {}

	getLast: =>
		@children[#@children]

	getActiveWidgets: =>
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

		with @\resume!
			if .resume
				\resume!

	__tostring: =>
		"@[PageStack: #{#@children} children]"


