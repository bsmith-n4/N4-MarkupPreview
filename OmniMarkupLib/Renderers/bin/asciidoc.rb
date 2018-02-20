# -*- coding: utf-8 -*-
require 'asciidoctor'
require_relative '../ext/todo.rb'
require_relative '../ext/docinfo.rb'
require_relative '../ext/task.rb'
require_relative '../ext/cwiki.rb'

# Pass some conversion attributes to asciidoctor
configs = {
  'icons' => 'font',
	'toc' => 'left',
	'toclevels' => '5',
	'sectnumlevels' => '3',
	'doctype' => 'book',
	'sectnums' => 'sectanchors',
	'linkattrs' => 'true',
	'sectlinks' => 'true',
	'find' => ''
}

# Force utf-8 encoding
begin
  $stdin.set_encoding 'utf-8'
  $stdout.set_encoding 'utf-8'
rescue
end

text = $stdin.read
$stdout.write Asciidoctor::Document.new(text, attributes: configs).render
