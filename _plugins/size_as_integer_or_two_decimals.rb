# Formats a number to either an integer or a two-decimal number if it is not an integer.
# Sets the decimal separator to a comma (French notation).

module Jekyll
	class SizeAsIntegerOrTwoDecimalsTag < Liquid::Tag

		def render(context)
			@value = context.registers[:page]['size']

			if @value.integer?
				@value
			else
				sprintf('%0.02f', @value).tr('.', ',')
			end
		end
	end
end

Liquid::Template.register_tag('size_as_integer_or_two_decimals', Jekyll::SizeAsIntegerOrTwoDecimalsTag)
