require 'asciidoctor/extensions'

include ::Asciidoctor

Extensions.register do
  postprocessor do
    process do |document, output|
      output = output.gsub(/<\/p>/, '') if document.basebackend? 'html'
      output
    end
  end
end
