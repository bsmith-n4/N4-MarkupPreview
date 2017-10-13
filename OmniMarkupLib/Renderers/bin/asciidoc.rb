# -*- coding: utf-8 -*-
require 'asciidoctor'
require 'jekyll_aspec'

# Force utf-8 encoding
begin
    $stdin.set_encoding 'utf-8'
    $stdout.set_encoding 'utf-8'
rescue
end

text = $stdin.read
options = {'icons'=>'font'}
$stdout.write Asciidoctor::Document.new(text, attributes: options).render
