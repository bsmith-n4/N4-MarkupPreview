require 'asciidoctor/extensions'

include ::Asciidoctor

# @example Basic Usage
#   See call:1[] for details
Asciidoctor::Extensions.register do
  inline_macro do
    named :call
    process do |parent, target, _attrs|
      Asciidoctor::Inline.new(parent, :callout, target.to_i).convert
    end
  end
end
