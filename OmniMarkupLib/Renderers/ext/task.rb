require 'asciidoctor/extensions'
require_relative 'utils/labels'
require_relative 'utils/block'

include ::Asciidoctor

prefix = ''

# @example Basic Usage
#   See task:101[] for details
# @example Block Use
#   Already completed. task::101[]
# @example Configuration
# :task_def_OPR-: Jira;OPR Backlog;https://jira.myorg.eu/browse/OPR-{TASK_ID};images/icons/jira.png;OPR-{TASK_ID}
# :task_def_GH-: GitHub;Project GitHub Issues;https://github.organisation.com/MyOrg/repo/issues
Extensions.register do
  inline_macro do
    named :task

    process do |parent, target, attrs|
      pa = ''
      dest = target.match(/\w+-/).to_s.downcase if target[/-/]
      pattern = parent.document.attr 'task-pattern'

      parent.document.attributes.each do |key, value|
        next unless key[/^task_def_/]
        prefix = key.sub(/^task_def_/, '')
        if dest == prefix
          type, tip, patt, icon, id = value.match(/^([^^]+)\;([^^]+)\;([^^]+)\;([^^]+)\;([^^]+)/).captures
          patt.gsub!(/\/(\w+?-)?{.+?}/, '')
          pattern = patt
        end
      end

      if pattern.nil?
        warn "asciidoctor: WARNING: Task pattern not defined for #{target.delete(':')}"
        pattern = 'unknown'
      end

      url = pattern % target

      label = Labels.getstatus(attrs)
      html = Context.format(attrs, target, url, label)
      (create_pass_block parent, html, attrs).render
    end
  end
end