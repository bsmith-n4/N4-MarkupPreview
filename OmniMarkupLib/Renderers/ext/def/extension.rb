require 'asciidoctor/extensions'
include Asciidoctor

# An extension that introduces a custom admonition type, complete
# with a custom icon.
#
# Usage
#
#   [def]
#   --
#   My amazing Definition
#   --
#
# or
#
#   [def]
#   Define Irony;
#

class DefBlock < Extensions::BlockProcessor
  use_dsl
  named :def
  on_contexts :example, :open, :paragraph

  def process parent, reader, attrs
    attrs['name'] = 'definition'
    attrs['caption'] = 'Defintion'
    create_block parent, :open, reader.lines, attrs, content_model: :compound
  end
end

# TODO: revisit the styling here after TODO block experiments.
#
# class DefBlockDocinfo < Extensions::DocinfoProcessor
#   use_dsl
# 
#   def process doc
#     '<style>
#       .admonitionblock td.icon .icon-todo:before{content:"\f249";color:#f4ee42}
#     </style>'
#   end
# end
