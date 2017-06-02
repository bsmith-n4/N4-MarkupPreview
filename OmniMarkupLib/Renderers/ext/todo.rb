RUBY_ENGINE == 'opal' ?
  (require 'todo/extension') :
  (require_relative 'todo/extension')

Extensions.register do
  block CustomAdmonitionBlock
  docinfo_processor CustomAdmonitionBlockDocinfo
end
