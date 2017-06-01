require 'asciidoctor/extensions'
include Asciidoctor

# An extension that introduces a TODO admonition Block.
#
# Usage:
#
#   [TODO]
#   Add autocomplete across all tabs
#
#
# or:
#
#   .Title (optional)
#   [TODO]
#   ====
#   Rewrite everything in Ruby
#   ====
#
# The following delimiters can also be used:
#
#   ====
#   --
#   ++++
#   ****
#   ----
#

class TodoBlock < Extensions::BlockProcessor
  use_dsl
  named :TODO
  on_contexts :open, :paragraph, :example, :listing, :sidebar, :pass

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