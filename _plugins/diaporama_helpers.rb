# Generation helpers for diaporama parsing and generation.
#
# Allows for [Fotorama](http://fotorama.io) usage.
#
# Author: Matti Schneider
# License: MIT


module Fotorama
	def self.render(page_id, diaporama_name, user_data, additional_classes = '')
		classes = 'fotorama ' + additional_classes
		result = '<div class="' + classes.strip + '" data-nav="none" data-allowfullscreen="native" data-fit="scaledown" data-transition="slide" data-width="100%" data-maxheight="100%">' # see usage of data attributes at http://fotorama.io/customize/

		result << '<img src'

		user_data.each do |filenames, caption|
			filename = filenames[0]
			filename_fullwidth = filenames[1]

			result << '="'
			result << image_path(page_id, diaporama_name, filename)
			result << '" '
			result << 'data-full="' + image_path(page_id, diaporama_name, filename_fullwidth) + '" ' if filename_fullwidth
			result << html_metadata(caption)
			result << '></a><a href'	# ending with an empty <a> is less annoying than having a loop initialization
		end

		result << '></a></div>'
	end

	def self.image_path(page_id, diaporama_name, image_name)
		'../images/diaporamas/' << page_id << '/' << diaporama_name << '/' << image_name
	end

	# Generates HTML attributes from a raw, possibly multiline, caption.
	#
	# Returns a string ready for inclusion in an `img` or `a` tag, with Fotorama-related tags.
	def self.html_metadata(caption)
			caption = caption.strip.tr('"', '“').split('\n')

			result =  'title="'
			result << caption.join(' ')
			result << '" data-caption="'	# for fotorama
			result << caption.join('&lt;br/&gt;')
			result << '"'
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
			filename = parts.shift.split('/').map(&:strip)
			result[filename] = parts.join('\n')
		end

		result
	end
end
