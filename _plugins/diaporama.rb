# Jekyll DiaporamaTag
#
# Lists images in a given folder, allowing end-user to specify captions.
#
# Adds data for [Fotorama](http://fotorama.io) usage.
#
# Author: Matti Schneider
# License: MIT

require_relative 'diaporama_helpers.rb'


module Jekyll

	class DiaporamaTag < Liquid::Block

		def initialize(tag_name, text, tokens)
			super
			parts = text.split(',')
			@diaporama_name = parts[0].strip
			@additional_classes = parts[1] ? parts[1].strip : ''
		end

		def render(context)
			page = context.registers[:page]

			page_id = page['id'] || page['title'].downcase

			Fotorama::render(page_id, @diaporama_name, user_data, @additional_classes)
		end

		# Transforms the text within the `diaporama` tag to a data structure
		def user_data
			DiaporamaParser::parse @nodelist[0]
		end
	end
end

Liquid::Template.register_tag('diaporama', Jekyll::DiaporamaTag)
