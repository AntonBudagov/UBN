define [], ->

  # Share#######################################################################
  $('.share').on 'click', (ev) ->
      $(this).parent().toggleClass('active')

  maxWidth = 641
  # Carusel#####################################################################
  slickBaseSettings =

    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true,
    centerMode: true
    centerPadding: '10rem'
    arrows: false
    responsive: [ {
      breakpoint: maxWidth
      # settings: 'unslick'
    } ]

  runSlick = ->
    $('#sliderBestMaterials').slick slickBaseSettings
  runSlick()

  $(window).on 'resize', ->
    width = $(window).width()
    if width < maxWidth
      runSlick()

  # Lazy Load###################################################################
  initLazyLoad = ->
    size_li = $('#sliderBestMaterials .slide').size()
    console.log size_li
    x = 3
    $('#sliderBestMaterials .slide:lt(' + x + ')').show()
    $('#loadMore').click ->
      x = if x + 3 <= size_li then x + 3 else size_li
      $('#sliderBestMaterials .slide:lt(' + x + ')').slideDown(350)
      if x == size_li
        $(this).parent().hide()


  # Resize######################################################################
  do ->
    windowScreen = $( window ).width()
    smallLogo = $('#logo').text("BNM")
    mediumLogo = $('#logo').text("BestNewsMedia")
    if windowScreen <= 641
      $('#logo').text("BNM")
      console.log "small"
      # initCarusel()
    else
      console.log "large"
      $('#logo').text("BestNewsMedia")
      $('#sliderBestMaterials').slick('unslick')
      mediumLogo
      initLazyLoad()

  $(window).resize ->
    mediumLogo = $('#logo').text("BestNewsMedia")
    smallLogo = $('#logo').text("BNM")
    windowScreen = $( window ).width()
    console.log windowScreen
    if windowScreen <= 641
      $('#logo').text("BNM")
      console.log "small"

    if windowScreen > 700
      initLazyLoad()
      $('#logo').text("BestNewsMedia")
      console.log "large"

  # Menu########################################################################
  do ->
    bodyEl = document.body
    content = document.querySelector('.content-wrap')
    openbtn = document.getElementById('open-button')
    closebtn = document.getElementById('close-button')
    closeContent = $('.content')
    sidebar = $('.cd-nav-trigger')
    isOpen = false
    overlay = $('.content-overlay')

    init = ->
      initEvents()

    initEvents = ->
      openbtn.addEventListener 'click', toggleMenu

      if closebtn
        closebtn.addEventListener 'click', toggleMenu

      overlay.on 'click', (ev) ->
        target = ev.target
        if isOpen and target != openbtn
          toggleMenu()

    toggleMenu = ->
      if isOpen
        openbtn.className = 'cd-nav-trigger'
        bodyEl.className = ''
        overlay.removeClass('active')
      else
        bodyEl.className += 'show-menu'
        openbtn.className += ' nav-is-visible'
        overlay.addClass('active')

      isOpen = !isOpen


    init()
