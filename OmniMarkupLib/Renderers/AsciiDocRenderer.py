from .base_renderer import *
import os.path


__file__ = os.path.normpath(os.path.abspath(__file__))
__path__ = os.path.dirname(__file__)


@renderer
class AsciiDocRenderer(CommandlineRenderer):
    def __init__(self):
        super(AsciiDocRenderer, self).__init__(
            input_method=InputMethod.FILE,
            executable='asciispec',
            args=["{filename}", "--out-file -"])

    @classmethod
    def is_enabled(cls, filename, syntax):
        if syntax == 'text.html.asciidoc':
            return True
        return (filename.endswith('.asc') or filename.endswith('.adoc') or
                filename.endswith('.asciidoc'))
