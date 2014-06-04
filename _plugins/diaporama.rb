# Jekyll DiaporamaTag
#
# Lists images in a given folder, allowing end-user to specify captions.
#
# Adds data for [Fotorama](http://fotorama.io) usage.
#
# Author: Matti Schneider
# License: MIT


module Jekyll


	class DiaporamaTag < Liquid::Block


		def initialize(tag_name, text, tokens)
			super
			@diaporama_name = text.strip
		end


		def render(context)
			page_id = context.registers[:page]['title'].downcase

			result = '<div class="fotorama" data-nav="thumbs" data-allowfullscreen="native" data-fit="scaledown" data-transition="crossfade">' # see usage of data attributes at http://fotorama.io/customize/

			user_data.each do |img_name, caption|
				caption.strip!.tr!('"', '“')
				result << '<img src="'
				result << '/images/diaporamas/' << page_id << '/' << @diaporama_name << '/' << img_name
				result << '" title="'
				result << caption
				result << '" data-caption="'	# for fotorama
				result << caption
				result << '"/>'
			end

			result << '</div>'
		end

		# Transforms the text within the `diaporama` tag to a data structure
		def user_data
			text_to_data @nodelist[0]
		end

		# Transforms a sequence of lines to a data structure
		#
		# Example:
		#		toto : titi
		#		tutu: tata
		# Will generate:
		#		{"toto" => "titi", "tutu" => "tata"}
		def text_to_data(text)
			data = []

			text.each_line do |line|
				data.push(line.split(/\s*:\s*/)) unless line.strip.empty?
			end

			Hash[data]
		end
	end
end

Liquid::Template.register_tag('diaporama', Jekyll::DiaporamaTag)
