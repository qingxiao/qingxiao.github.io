<script type="text/javascript" id="motion.global">
  $(document).ready(function () {
    var body = $('body');
    var isSidebarVisible = false;
    var sidebarToggle = $('.sidebar-toggle');
    var sidebarToggleLine1st = $('.sidebar-toggle-line-first')
    var sidebarToggleLine2nd = $('.sidebar-toggle-line-middle');
    var sidebarToggleLine3rd = $('.sidebar-toggle-line-last');
    var sidebar = $('.sidebar');

    var SIDEBAR_WIDTH = '320px';
    var SIDEBAR_DISPLAY_DURATION = 300;

    var sidebarToogleLineStatusInit = {width: '100%', opacity: 1, left: 0, rotateZ: 0, top: 0};

    var sidebarToggleLine1stStatusInit = sidebarToogleLineStatusInit;
    var sidebarToggleLine1stStatusArrow = {width: '50%', rotateZ: '-45deg', top: '2px'};
    var sidebarToogleLine1stStatusClose = {width: '100%', rotateZ: '-45deg', top: '5px'};

    var sidebarToggleLine2ndStatusInit = sidebarToogleLineStatusInit;
    var sidebarToggleLine2ndStatusArrow = {width: '90%'};
    var sidebarToogleLine2ndStatusClose = {opacity: 0};

    var sidebarToggleLine3rdStatusInit = sidebarToogleLineStatusInit;
    var sidebarToggleLine3rdStatusArrow = {width: '50%', rotateZ: '45deg', top: '-2px'};
    var sidebarToogleLine3rdStatusClose = {width: '100%', rotateZ: '45deg', top: '-5px'};

    LogoAndMenuMotion();
    sidebatToggleMotion();
    postsListMotion();
    backToTopMotion();


    $(document)
      .on('sidebar.isShowing', function () {
        isDesktop() && body.velocity(
          {paddingRight: SIDEBAR_WIDTH},
          SIDEBAR_DISPLAY_DURATION
        );
        sidebarContentMotion();
      })
      .on('sidebar.isHiding', function () {});

    function LogoAndMenuMotion() {
      $.Velocity.RunSequence([
        { e: $('.brand'), p: { opacity: 1 }, o: { duration: 100 } },
        { e: $('.logo'), p: { opacity: 1, top: 0 }, o: { duration: 50} },
        {% if theme.scheme === 'Mist' %}
        { e: $('.logo-line-before i'), p: { translateX: "100%" }, o: { duration: 500, sequenceQueue: false } },
        { e: $('.logo-line-after i'), p: { translateX: "-100%" }, o: { duration: 500, sequenceQueue: false } },
        {% endif %}
        { e: $('.site-title'), p: { opacity: 1, top: 0 }, o: { duration: 200 } }
      ]);
      $('.menu-item').velocity('transition.slideDownIn', {
          display: null,
          complete : function () {
              var $mask = $('.loading-mask'),
                   $out = $mask.find('.circle-outer'),
                   $mid = $mask.find('.circle-middle'),
                   $inner = $mask.find('.circle-inner');
              var styles = {opacity:0, margin:'100%'};
              var speed = 350;
              $inner.animate(styles, speed, function(){
                  $mid.animate(styles, speed, function(){
                      $out.animate(styles, speed, function(){
                          $mask.remove();
                      });
                  });
              });
          }
      });
    }


    function backToTopMotion () {
      var b2top = $('.back-to-top');
      b2top.on('click', function () {
        body.velocity('scroll');
      });
    }

    function sidebarShowMotion () {

      sidebarToggleLine1st.velocity(sidebarToogleLine1stStatusClose);
      sidebarToggleLine2nd.velocity(sidebarToogleLine2ndStatusClose);
      sidebarToggleLine3rd.velocity(sidebarToogleLine3rdStatusClose);

      sidebar.velocity({width: SIDEBAR_WIDTH}, {
        display: 'block',
        duration: SIDEBAR_DISPLAY_DURATION,
        complete: function () {
          sidebar.addClass('sidebar-active');
          sidebar.trigger('sidebar.didShow');
          $(".loading-mask").hide();
        }
      });
      sidebar.trigger('sidebar.isShowing');
    }

    function sidebarHideMotion () {
      isDesktop() && body.velocity({paddingRight: 0});
      sidebar.velocity('reverse');

      sidebarToggleLine1st.velocity(sidebarToggleLine1stStatusInit);
      sidebarToggleLine2nd.velocity(sidebarToggleLine2ndStatusInit);
      sidebarToggleLine3rd.velocity(sidebarToggleLine3rdStatusInit);

      sidebar.removeClass('sidebar-active');
      sidebar.trigger('sidebar.isHiding');
    };

    function sidebarContentMotion () {
      $('.sidebar .motion-element').velocity(
        'transition.slideRightIn',
        {stagger: 50, drag: true}
      );
    }

      function postsListMotion() {
          var postMotionOptions = window.postMotionOptions || {stagger: 300, drag: true};
          $('.post').velocity('transition.slideDownIn', postMotionOptions);
      }

    function sidebatToggleMotion () {
      sidebarToggle.on('click', function () {
        isSidebarVisible ? sidebarHideMotion() : sidebarShowMotion();
        isSidebarVisible = !isSidebarVisible;
      });

      sidebarToggle.hover(function () {
        if (isSidebarVisible) {return}
        sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusArrow);
        sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusArrow);
        sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusArrow);
      }, function () {
        if (isSidebarVisible) {return}
        sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusInit);
        sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusInit);
        sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusInit);
      });
    }
  });

</script>
