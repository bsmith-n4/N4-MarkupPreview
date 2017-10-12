require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'

include ::Asciidoctor

Extensions.register do
  block do
    named :TODO
    on_contexts :open, :paragraph, :example, :listing, :sidebar, :pass

    process do |parent, reader, attrs|
      attrs['name'] = 'todo'
      attrs['caption'] = 'Todo'
      create_block parent, :admonition, reader.lines, attrs, content_model: :compound
    end
  end
end
