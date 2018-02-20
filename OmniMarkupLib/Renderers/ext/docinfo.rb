require 'asciidoctor/extensions'
include ::Asciidoctor

Extensions.register do
  docinfo_processor do
    at_location :footer
    process do |doc|
      '<style>.admonitionblock td.icon .icon-todo:before{content:"\f249";color:#f4ee42}</style>'
    end
  end
end