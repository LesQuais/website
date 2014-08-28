# Output a narrow non-breaking space.
# See more at http://stackoverflow.com/questions/595365/how-to-render-narrow-non-breaking-spaces-in-html-for-windows#answer-1570664

module Jekyll

  class Nnbsp < Liquid::Tag
    def render(context)
      '<span style="white-space:nowrap">&thinsp;</span>'
    end
  end

end

Liquid::Template.register_tag('nnbsp', Jekyll::Nnbsp)
