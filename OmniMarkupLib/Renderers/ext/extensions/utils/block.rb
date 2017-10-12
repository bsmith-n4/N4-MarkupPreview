# Helper methods handling whether to output inline content or a block.
# Will read the attributes of the current macro and output a HTML string that is either
# inline or a block (float-right).
module Context
  # @param attributes [Array] attributes passed by the inline macro
  # @param target [String] the target text
  # @param pattern [String] the target url
  # @param label [String] an optional status label, used to display if a task/issue is open or closed
  # @return [String] the raw HTML to be included in the target document
  def self.format(attributes, target, pattern, label)
    block = false
    block = true if attributes.key? 'block'

    if target[0] == "\:"
      block = true
      target[0] = ''
    end

    url = "#{pattern}/#{target}"

    html = if block
             if pattern == 'unknown'
               "<div style=\"float:right;padding-left:0.1em;\"><span class=\"label label-#{label}\" data-toggle=\"tooltip\" title=\"Missing config\">#{target}</span></div>"
             else
               "<div style=\"float:right;padding-left:0.1em;\"><a href=\"#{url}\"><span class=\"label label-#{label}\">#{target}</span></a></div>"
                    end
           else
             if pattern == 'unknown'
               "<span class=\"label label-#{label}\" data-toggle=\"tooltip\" title=\"Missing config\">#{target}</span>"
             else
               "<a href=\"#{url}\"><span class=\"label label-#{label}\">#{target}</span></a>"
                    end
           end
    html
  end
end
