# Generation helpers for diaporama parsing and generation.
#
# Allows for [Fotorama](http://fotorama.io) usage.
#
# Author: Matti Schneider
# License: MIT


module Fotorama
	def self.render(page_id, diaporama_name, user_data)
		result = '<div class="fotorama" data-nav="thumbs" data-allowfullscreen="native" data-fit="scaledown" data-transition="crossfade" data-width="50%" data-ratio="4/3">' # see usage of data attributes at http://fotorama.io/customize/

		user_data.each do |img_name, caption|
			caption = caption.strip.tr('"', '“').split('\n')

			result << '<img src="'
			result << '/images/diaporamas/' << page_id << '/' << diaporama_name << '/' << img_name
			result << '" title="'
			result << caption.join(' ')
			result << '" data-caption="'	# for fotorama
			result << caption.join('&lt;br/&gt;')
			result << '"/>'
		end

		result << '</div>'
	end
end

module DiaporamaParser
	# Transforms a sequence of lines to a data structure
	#
	# Example:
	#		toto : titi
	#		tutu: tata
	# Will generate:
	#		{"toto" => "titi", "tutu" => "tata"}
	def self.parse(text)
		result = {}

		entries = text.strip.gsub(/\r\n/, '\n').split(/\n{2,}/)

		entries.each do |entry|
			parts = entry.split(/\n/)
			filename = parts.shift
			result[filename] = parts.join('\n')
		end

		result
	end
end
