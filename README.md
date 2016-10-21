#### Quick Setup:

The **Asciidoctor** RubyGem is a prerequisite for ```.adoc``` files:

```gem install asciidoctor```

#### Installing OmniMarkupPreviewer through [Package Control]

[Package Control]: http://wbond.net/sublime_packages/package_control

Installing via Package Control will keep OmniMarkupPreviewer
up-to-date automatically.

Once Package Control is installed, restart Sublime Text.

1. Open the Command Palette (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>
   on Windows and Linux. <kbd>⌘</kbd>+<kbd>⇧</kbd>+<kbd>P</kbd> on OS X).
2. Type "Install" and select "Package Control: Install Package".
3. Select "OmniMarkupPreviewer" from list.

#### Manual Git Install

Type the following command in your Sublime Text Packages directory:

`git clone git://github.com/bsmith-n4/OmniMarkupPreviewer.git`

The 'Packages' directory for Sublime Text 3 is located at:

* **Windows:**  `%APPDATA%\Sublime Text 3\Packages\`
* **Linux:**    `~/.config/sublime-text-3/Packages/`
* **OS X:**     `~/Library/Application Support/Sublime Text 3/Packages/`

### Supported Languages / Syntaxes

The previewer has builtin support for the following markups:

* [Markdown](http://daringfireball.net/projects/markdown/)
* [reStructuredText](http://docutils.sourceforge.net/rst.html)
* [WikiCreole](http://wikicreole.org/)
* [Textile](http://www.textism.com/tools/textile/)
* [Pod](http://search.cpan.org/dist/perl/pod/perlpod.pod) (Requires Perl >= `5.10`
  and can be found in `PATH`, if the perl version < `5.10`, `Pod::Simple` should be
  installed from `CPAN`.)
* [RDoc](http://rdoc.sourceforge.net/) (Requires `ruby` in your `PATH`)
* [Org Mode](http://orgmode.org) (Requires `ruby`, and gem `org-ruby` should be installed)
* [MediaWiki](http://www.mediawiki.org/) (Requires `ruby`, as well as gem `wikicloth`)
* [AsciiDoc](http://www.methods.co.nz/asciidoc/) (Requires `ruby`, as well as gem `asciidoctor`)
* Literate Haskell


### Default Key Bindings

**OSX:**

* <kbd>⌘</kbd>+<kbd>⌥</kbd>+<kbd>O</kbd>: Preview Markup in Browser.
* <kbd>⌘</kbd>+<kbd>⌥</kbd>+<kbd>X</kbd>: Export Markup as HTML.
* <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>C</kbd>: Copy Markup as HTML.

**Windows, Linux:**

* <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>O</kbd>: Preview Markup in Browser.
* <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>X</kbd>: Export Markup as HTML.
* <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>C</kbd>: Copy Markup as HTML.
