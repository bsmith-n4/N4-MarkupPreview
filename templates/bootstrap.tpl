<!DOCTYPE html>
<!-- bootstrap.TPL -->
<html>
  <head>
    <meta charset="utf-8">
    <title>{{filename}}—{{dirname}}</title>
    
    <script src="/public/scripts/prism.js"></script>
    <link href="/public/styles/prism.min.css" rel="stylesheet" />

    <!-- Main stylesheet -->
    <link rel="stylesheet" type="text/css" href="/public/styles/default.css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- ************* Font Awesome Icons ********* -->
    <link rel="stylesheet" href="/public/styles/font-awesome/css/font-awesome.min.css">
    
    <!-- ************* Favicon ************-->
    <link rel="icon" href="/public/styles/favicon.ico" />
    
    <!-- ************* Back-to-top JQuery ************* -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
  </head>


  <nav class="navbar navbar-default navbar-static-top">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand" href="https://github.com/bsmith-n4/N4-MarkupPreview">Markup Previewer</a>
      </div>
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
