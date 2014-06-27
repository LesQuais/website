# Store a block's content in a data container.

module Jekyll

	class Legend < Liquid::Block
		def render(context)
			converter = context.registers[:site].getConverterImpl(::Jekyll::Converters::Markdown)
			content = converter.convert(super)

			"<div class=\"legend\">#{content}</div>"
		end
	end
end

Liquid::Template.register_tag('legend', Jekyll::Legend)
