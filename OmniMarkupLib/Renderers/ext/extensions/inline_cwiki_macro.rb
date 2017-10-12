require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'
require_relative 'utils/labels'
require_relative 'utils/block'

include ::Asciidoctor

# @example Basic Usage
#   See cwiki:topic[] for details
# @example Block Use
#   Already documented. cwiki::topic[]
Extensions.register do
  inline_macro do
    named :cwiki

    process do |parent, target, attrs|
      pattern = parent.document.attr 'cwiki-pattern'

      if pattern.nil?
        warn "asciidoctor: WARNING: Attribue 'cwiki-pattern' for inline repo macro not defined"
        pattern = 'unknown'
        label = 'warning'
        target = 'cwiki-pattern missing'
      else
        label = Labels.getstatus(attrs)
      end

      html = Context.format(attrs, target, pattern, label)
      (create_pass_block parent, html, attrs).render
    end
  end
end
