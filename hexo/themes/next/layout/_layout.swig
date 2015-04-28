<!doctype html>
<html class="theme-next {% if theme.use_motion %}use-motion{% endif %} {% if theme.scheme %}theme-next-{{ theme.scheme | lower }}{% endif %}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
    <style>
        @-moz-keyframes rotate{
            0%{ -moz-transform:rotate(0deg);}
            100%{-moz-transform:rotate(-360deg);}
        }
        @-webkit-keyframes rotate{
            0%{ -webkit-transform:rotate(0deg);}
            100%{-webkit-transform:rotate(-360deg);}
        }
        .loading-mask{
            position: fixed;
            top:0;
            left:0;
            width:100%;
            height:100%;

        }
        .loading-box{
            width:200px;
            height:200px;
            position: fixed;
            left:50%;
            top:50%;
            margin-left:-100px;
            margin-top:-100px;
        }
        .quarter-circle{
            border-color: transparent transparent #000 #ccc;
            border-radius: 50%;
            border-style: solid;
            border-width: 5px;
            padding:20px;
            width:100%;
            background-color: transparent;
            height: 100%;
            box-sizing: border-box;
            -moz-animation:rotate 2s linear infinite;
            -webkit-animation:rotate 2s linear infinite;
            animation:rotate 2s linear infinite;

        }
        .circle-outer{
            border-color:#FFFF00 #FF00FF transparent transparent;
            -moz-animation-duration:2s;
            -webkit-animation-duration:1s;
            animation-duration:1s;
        }
        .circle-middle{
            border-color: transparent #33FF66 #66FFFF transparent;
            -moz-animation-duration:3s;
            -webkit-animation-duration:2s;
            animation-duration:2s;
        }
        .circle-inner{
            border-color: transparent transparent #999900 #0099FF;
            -moz-animation-duration:5s;
            -webkit-animation-duration:3s;
            animation-duration:3s;
        }
    </style>
</head>

<body>
  <div class="container one-column {% block page_class %}{% endblock %}">
      <div class="loading-mask">
          <div class="loading-box">
              <div class="quarter-circle circle-outer">
                     <div class="quarter-circle circle-middle">
                          <div class="quarter-circle circle-inner"></div>
                      </div>
              </div>
          </div>
      </div>
    <div class="headband"></div>

    <div id="header" class="header">
      <div class="header-inner">
        {% include '_partials/header.swig' %}
      </div>
    </div>

    <div id="main" class="main">
      <div class="main-inner">
        <div id="content" class="content">
          {% block content %}{% endblock %}
        </div>
      </div>

      {% block sidebar %}{% endblock %}
    </div>

    <div id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
      </div>
    </div>

    <div class="back-to-top"></div>
  </div>

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/jquery/index.js?v=2.1.3"></script>

  {# This block is used to set options before any other scripts run #}
  {% block script_extra_before %}{% endblock %}

  {% include '_scripts/fancy-box.swig' %}
  {% include '_scripts/helpers.swig' %}
  {% include '_scripts/motion.swig' %}


  {% block script_extra %}{% endblock %}

  {% include '_scripts/mathjax.swig' %}
  {% block comment_system %}{% endblock %}

  {% include '_scripts/analytics/baidu-analytics.swig' %}
  {% include '_scripts/analytics/google-analytics.swig' %}

</body>

</html>
