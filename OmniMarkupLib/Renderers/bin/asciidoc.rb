require 'asciidoctor'
require 'aspec_rb'

# Force utf-8 encoding
begin
  $stdin.set_encoding 'utf-8'
  $stdout.set_encoding 'utf-8'
rescue StandardError
end

text = $stdin.read
options = { 'icons' => 'font' , 'toc' => 'left', 'toclevels' => '5'}
$stdout.write Asciidoctor::Document.new(text, safe: 'unsafe', attributes: options).render
