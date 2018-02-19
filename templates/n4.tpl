<!DOCTYPE html>
<!-- N4.TPL -->
<html>
  <head>
    <meta charset="utf-8">
    <title>{{filename}}—{{dirname}}</title>
    <script src="/public/scripts/prism.js"></script>
    <link href="/public/styles/prism.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/public/styles/foundation.css">

    <!-- ************* Font Awesome Icons ********* -->
    <link rel="stylesheet" href="/public/styles/font-awesome/css/font-awesome.min.css">
    
    <!-- ************* Favicon ************-->
    <link rel="icon" href="/public/styles/favicon.ico" />
    
    <!-- ************* Back-to-top JQuery ************* -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script type="text/javascript" src="/public/scripts/nav-mobile.js"></script>

    <!-- ****************** NavBar ****************** -->
    <div id="menubar">
      <div class="banner">
        <img src="/public/styles/logo.png" alt="AsciiSpec LivePreview"></a>
      </div>
    </div>
    <button id="tocbutton">TOC</button>
    <!-- ****************** Mobile NavBar ****************** -->
    <div class="mobile-navbar">
    <ul id="menu">
    </ul>
    </div>
  </head>
  <body>
    <div class="container">
      <div id="markup" class="language-n4js">
        <article id="content" class="markdown-body">
          {{!html_part}}
        </article>
      </div>
    </div>
    <div id="footer">
  <div id="footer-text">
  </div>
</div>
<div class="social">
<ul class="fa-ul">
<!--<li><a href="https://github.numberfour.eu/NumberFour/datamodel/tree/master/"><i class="fa-li fa fa-github"></i>N4JS Repository</a></li> -->
</ul>
</div>
<script>
// Toggle the table of contents
$( "button#tocbutton" ).click(function() {
  if ($("#tocbutton").css('left') == '25px') {
    $( "#tocbutton" ).animate({left: '215px'},"slow");
    $( "#toc.toc2" ).animate({left: '0'},"slow");
    $( "#menubar" ).animate({left: '215px'},"slow");
    $( "#header, #content, #footnotes, #footer, .social" ).animate({left: '230px'},"slow");
    $( "body.toc2").css("max-width", "80%");
}
  else {
    $( "#menubar" ).animate({left: '10px'},"slow");
    $( "#tocbutton" ).animate({left: '25px'},"slow");
    $( "#toc.toc2" ).animate({left: '-13rem'},"slow");
    $( "#header, #content, #footnotes, #footer, .social" ).animate({left: '40px'},"slow");
    $( "body.toc2").css("max-width", "90%");
}
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
</script>
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
  <script type="text/javascript" src="/public/scripts/jquery-2.1.3.min.js"></script>
  <script type="text/javascript" src="/public/scripts/imagesloaded.pkgd.min.js"></script>
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
  %end
</html>