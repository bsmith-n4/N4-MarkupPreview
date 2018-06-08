require 'literati'

# Force utf-8 encoding
begin
  $stdin.set_encoding 'utf-8'
  $stdout.set_encoding 'utf-8'
rescue StandardError
end

text = $stdin.read
$stdout.write Literati.render(text)
