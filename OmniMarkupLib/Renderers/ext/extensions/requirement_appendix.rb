require 'asciidoctor'
require 'asciidoctor/extensions'

exts = "(\.adoc|\.md|\.html)"
docsdir = '_docs'

title = nil
chapter = nil
doctitle = nil

reqs = []
rows = []
# For commented requirements
coms = []

# For includes
inc_reqs = []
incs = []

CommentBlockRx = %r(^\/{4,}$)
CommentLineRx = %r{^//(?=[^/]|$)}

def trim(s)
  s.gsub!(/_docs\//, '')
  s.gsub!(/(\.adoc|\.md|\.html)/, '')
end

adoc_files = Dir.glob('**/*.adoc')
adoc_files.sort!
adoc_files.each do |f|
  inc = false
  commented = false
i = 0
  File.read(f).each_line do |li|
    i += 1
    incommentblock ^= true if li[CommentBlockRx]
    commented = true if li[CommentLineRx]
    inc = true if li[/published: false/]

    doctitle = /(?<=title:\s).+/.match(li) if li[/^title:\s+\w.+/] if i < 8
    chapter = /(?<=chapter:\s).+/.match(li) if li[/^chapter:\s+\w.+/]

    if li[/\[\s*req\s*,\s*id\s*=\s*\w+-?[0-9]+\s*,.*/]
      title.sub!(/^\./, '')
      req = [li.chop, f, title, chapter, doctitle]

      if commented || incommentblock
        coms.push(req)
      elsif inc
        inc_reqs.push(req)
      else
        reqs.push(req)
      end

    # Collect all includes
    elsif li[/^include::.+.adoc\[\]/]

      inc_file = li.chop.match(/(?<=^include::).+.adoc(?=\[\])/i).to_s
      path = inc_file.sub(/^#{docsdir}\//, '')
      path = path.sub(/#{exts}/, '')
      parent = f
      item = [inc_file, path, parent]
      incs.push item

    end
    title = li
  end
end

# Sort included reqs and correct the path to the parent (including doc)
# Push this back into 'normal' requirements array for regular processing
inc_reqs.each do |l, f, title, chapter, doctitle|
  incs.each do |incfile, _incpath, parent|
    if f == incfile
      item = [l, parent, title, chapter, doctitle]
      reqs.push item
    end
  end
end

reqs.uniq!

i = 0
reqs.each do |req, f, title, chapter, doctitle|
  i += 1
  # TODO - find better solution for sanitized titles:
  title = title.gsub(/\`/, '').gsub(/\'/, '').gsub(/\*/, '')
  
  id = /[^,]*\s*id\s*=\s*(\w+-?[0-9]+)\s*,.*/.match(req)[1]
  version = /(?<=version=)\d+/.match(req)

  f.gsub!(/^_docs\//, '')
  f.gsub!(/.adoc$/, '')

  link = "#{f}/index##{id}"
  ref = "<a class=\"link\" href=\"#{link}\"><emphasis role=\"strong\">#{title}</emphasis>  </a>"
  breadcrumb = "<a href=\"#{f}\">#{chapter} / #{doctitle}</a>"
  row = "<tr> <th scope=\"row\">#{i}</th> <td>#{id}</td><td>#{version}</td> <td>#{ref}</td> <td>#{breadcrumb}</td> </tr>"

  rows.push(row)
end

Asciidoctor::Extensions.register do
  block_macro :requirements do
    process do |parent, _target, _attrs|
      content = %(<h2 id="requirements"><a class="anchor" href="#requirements"></a><a class="link" href="#requirements">Requirements</a></h2>
<div class="panel panel-default"> <div class="panel-heading"><h4>Requirements</h4></div>
<table class="table"> <thead> <tr>
<th>#</th> <th>ID</th><th>Version</th> <th>Title</th> <th>Document</th>
</tr> </thead>
<tbody>
#{rows.join}
</tbody>
</table> </div>)

      create_pass_block parent, content, {}
    end
  end
end
