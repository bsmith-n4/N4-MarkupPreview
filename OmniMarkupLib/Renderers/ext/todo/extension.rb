require 'asciidoctor/extensions'

include Asciidoctor

# An extension that introduces a custom admonition type.
#
# Usage
#
#   [TODO]
#   ====
#   Rewrite everything in Ruby
#   ====
#
# or
#
#   [TODO]
#   Add autocomplete across all tabs
#
class TodoBlock < Extensions::BlockProcessor
  use_dsl
  named :TODO
  on_contexts :example, :open, :paragraph

  def process parent, reader, attrs
    attrs['name'] = 'todo'
    attrs['caption'] = 'Todo'
    create_block parent, :admonition, reader.lines, attrs, content_model: :compound
  end
end

class TodoBlockDocinfo < Extensions::DocinfoProcessor
  use_dsl

  def process doc
    '<style>
      .admonitionblock td.icon .icon-todo:before{content:"\f249";color:#f4ee42}
    </style>'
  end
end
