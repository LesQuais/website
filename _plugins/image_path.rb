# Loads an image, whatever its extension.

module Jekyll
	class ImagePathTag < Liquid::Tag

		EXTENSIONS = [ 'png', 'jpg' ]

		def initialize(tag_name, text, tokens)
			super
			@filename = text.strip
		end

		def render(context)
			@context = context
			first_matching_extension "#{root}/images/#{@filename}"
		end

		def root
			@context.registers[:site].config['source']
		end

		def first_matching_extension(filepath)
			result = filepath

			EXTENSIONS.each do |extension|
				tried_filename = "#{filepath}.#{extension}"
				result = tried_filename if File.exists? tried_filename
			end

			result
		end
	end
end

Liquid::Template.register_tag('image_path', Jekyll::ImagePathTag)
