<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{filename}}—{{dirname}}</title>
    <link rel="stylesheet" type="text/css" href="/public/n4.css">
    <!-- ************* Favicon ************-->
    <link rel="icon" href="https://www.numberfour.eu/favicon.ico" />
    <!-- ************* Back-to-top JQuery ************* -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script type="text/javascript" src="/public/nav-mobile.js"></script>

    <!-- ****************** NavBar ****************** -->
    <div id="menubar">
        <div class="banner">
          <img src="/public/logo.png" alt="AsciiSpec LivePreview"></a>
        </div>
    <ul class="fa-ul">
     <!-- <li><a href="/pages/numberfour/datamodel/index"></i>Docs Index</a></li> -->
      <li><a></i>AsciiDoc</a>
          <ul>
            <li><a href="/public/asciidoc-cheatsheet.html"></i>Syntax Cheat Sheet</a></li>
            <li><a href="/public/asciispec-cheatsheet.html"></i>Custom AsciiSpec Macros</a></li>
        </ul>
      </li>
    </ul>
    </div>
    <button id="tocbutton">TOC</button>
    <!-- ****************** Mobile NavBar ****************** -->
    <div class="mobile-navbar">
    <ul id="menu">
 <!--     <li><a class="scroll" href="/pages/numberfour/datamodel/index">Docs Index</a></li> -->
      <li><a class="scroll">AsciiDoc</a>
          <ul>
            <li><a href="/public/asciidoc-cheatsheet.html"></i>Syntax Cheat Sheet</a></li>
            <li><a href="/public/asciispec-cheatsheet.html"></i>Custom AsciiSpec Macros</a></li>
        </ul>
      </li>
    </ul>
    </div>
  </head>
  <body>
    <div class="container">
      <div id="markup">
        <article id="content" class="markdown-body">
          {{!html_part}}
        </article>
      </div>
    </div>
  </body>
  <script type="text/x-omnimarkup-config">
    window.App.Context = {
      buffer_id: {{buffer_id}},
      timestamp: '{{timestamp}}',
      revivable_key: '{{revivable_key}}'
    };
    window.App.Options = {
      ajax_polling_interval: {{ajax_polling_interval}},
      mathjax_enabled: {{'true' if mathjax_enabled else 'false'}}
    };
  </script>
  <script type="text/javascript" src="/public/jquery-2.1.3.min.js"></script>
  <script type="text/javascript" src="/public/imagesloaded.pkgd.min.js"></script>

  <script type="text/javascript" src="/public/app.js"></script>
  %if mathjax_enabled:
  <script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {
          inlineMath: [ ['$','$'], ["\\(","\\)"] ],
          displayMath: [ ['$$', '$$'], ["\\[", "\\]"] ],
          processEscapes: true
        },
        TeX: {
          equationNumbers: {
            autoNumber: 'AMS'
          }
        },
        'HTML-CSS': {
          imageFont: null
        }
      });
  </script>
  <script type="text/javascript" src="/public/mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
  <div id="footer">
<div id="footer-text">
</div>
</div>
<div class="social">
<ul class="fa-ul">
<li><a href="https://github.numberfour.eu/NumberFour/datamodel/tree/master/"><i class="fa-li fa fa-github"></i>N4JS Repository </a></li>
</ul>
</div>
<script>
// Toggle the table of contents
$( "button#tocbutton" ).click(function() {
  if ($("#tocbutton").css('right') == '25px') {
    $( "#tocbutton" ).animate({right: '215px'},"slow");
    $( "#toc.toc2" ).animate({right: '0'},"slow");
}
  else {
    $( "#tocbutton" ).animate({right: '25px'},"slow");
    $( "#toc.toc2" ).animate({right: '-13rem'},"slow");
}
});
</script>
<script>
// Initialise mobile menu
  $(function(){
    $('#menu').slicknav();
  });
</script>
<script type="text/javascript">
// Create a back to top button
$('body').prepend('<a href="#" class="back-to-top">Back to Top</a>');
var amountScrolled = 300;
$(window).scroll(function() {
if ( $(window).scrollTop() > amountScrolled ) {
  $('a.back-to-top').fadeIn('slow');
} else {
  $('a.back-to-top').fadeOut('slow');
}
});
$('a.back-to-top, a.simple-back-to-top').click(function() {
$('html, body').animate({
  scrollTop: 0
}, 700);
return false;
});
</script>
  %end
</html>
