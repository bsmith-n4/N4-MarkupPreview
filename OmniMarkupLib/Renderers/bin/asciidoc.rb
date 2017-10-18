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
options = {'icons'=>'font','skip-front-matter'=>'true'}
$stdout.write Asciidoctor::Document.new(text, :safe => 'unsafe',attributes: options).render
