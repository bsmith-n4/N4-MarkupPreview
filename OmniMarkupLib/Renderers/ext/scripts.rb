require 'asciidoctor/extensions'
include ::Asciidoctor

style = '<style>.admonitionblock td.icon .icon-note:before{content:"\f05a";color:#207c98}
.admonitionblock td.icon .icon-todo:before {
    content: "\f249";
    color: #f4ee42;
}
.todo {
    color: #dc143c;
    border: #dc143c;
    border-width: 2px;
    border-style: dotted;
    border-radius: 15px;
    padding: 0;
    background-color: #fff8dc;
    margin-bottom: 15px;
}
</style>'

Asciidoctor::Extensions.register do
	puts style
end
