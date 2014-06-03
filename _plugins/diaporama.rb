# Jekyll DiaporamaTag
#
# Lists images in a given folder, allowing end-user to specify captions.
#
# Author: Matti Schneider
# License: MIT


module Jekyll


	class DiaporamaTag < Liquid::Block


		def initialize(tag_name, markup, tokens)
			super
			@diaporama_name = markup.strip
		end


		def render(context)
			# @config = context.registers[:site].config['diaporamas']

			result = '<ol>'

			user_data.each do |img_name, caption|
				result << '<li><img src="'
				result << '/images/diaporamas/' << @diaporama_name << '/' << img_name
				result << '" title="'
				result << caption.strip.tr('"', '“')
				result << '" /></li>'
			end

			result << '</ol>'

			result
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
