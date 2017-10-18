<!DOCTYPE html>
<!-- jekyll_aspec.TPL -->
<html>
  <head>
    <meta charset="utf-8">
    <title>{{filename}}—{{dirname}}</title>
    <script src="/public/scripts/prism.js"></script>
    <link href="/public/styles/prism.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/public/styles/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- ************* Font Awesome Icons ********* -->
    <link rel="stylesheet" href="/public/styles/font-awesome/css/font-awesome.min.css">
    
    <!-- ************* Favicon ************-->
    <link rel="icon" href="/public/styles/favicon.ico" />
    
    <!-- ************* Back-to-top JQuery ************* -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script type="text/javascript" src="/public/scripts/nav-mobile.js"></script>

  </head>


  <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
          </button>
          <a class="navbar-brand" href="https://github.com/bsmith-n4/N4-MarkupPreview">Markup Previewer</a>
        </div>
<!--         <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="https://github.com/bsmith-n4/N4-MarkupPreview">GitHub</a></li>
          </ul>
        </div> -->
      </div>
    </nav>

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
</ul>
</div>
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
