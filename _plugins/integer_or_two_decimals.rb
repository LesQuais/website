module TextFilter
	def integer_or_two_decimals(input)
		input_float = input.to_f
		sprintf('%0.02f', input).tr('.', ',').gsub(',00', '')
	end
end

Liquid::Template.register_filter(TextFilter)
