# Store a block's content in a data container.

module Jekyll

  class Below < Liquid::Block
    def render(context)
      context.registers[:page]['below'] = super
      # return an empty string
      ''
    end
  end

end

Liquid::Template.register_tag('below', Jekyll::Below)
