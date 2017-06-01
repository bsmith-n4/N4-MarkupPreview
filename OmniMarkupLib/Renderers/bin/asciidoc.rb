# -*- coding: utf-8 -*-
require 'asciidoctor'
require_relative '../ext/todo/extension'
require_relative '../ext/def/extension'

# Register the TODO block processor
Extensions.register do
  block TodoBlock
  block DefBlock
  docinfo_processor TodoBlockDocinfo
end

# Force utf-8 encoding
begin
    $stdin.set_encoding 'utf-8'
    $stdout.set_encoding 'utf-8'
rescue
end

text = $stdin.read
$stdout.write Asciidoctor::Document.new(text).render
