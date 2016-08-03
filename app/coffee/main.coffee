define ['extra'], (extra)->
  console.log "Thiss Main and: #{extra}"
  # s = skrollr.init()

  # Carusel

  $('#sliderBestMaterials').slick
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true,
    centerMode: true

  'use strict'
  # Menu
  do ->
    bodyEl = document.body
    content = document.querySelector('.content-wrap')
    openbtn = document.getElementById('open-button')
    closebtn = document.getElementById('close-button')
    closeContent = $('.content')
    sidebar = $('.cd-nav-trigger')
    isOpen = false
    morphEl = document.getElementById('morph-shape')
    s = Snap(morphEl.querySelector('svg'))
    path = s.select('path')
    initialPath = path.attr('d')
    pathOpen = morphEl.getAttribute('data-morph-open')
    isAnimating = false

    init = ->
      initEvents()


    initEvents = ->
      # event.preventDefault()
      openbtn.addEventListener 'click', toggleMenu

        # sidebar.className += ' nav-is-visible'

      if closebtn
        closebtn.addEventListener 'click', toggleMenu



      closeContent.on 'click', (ev) ->

        target = ev.target
        if isOpen and target != openbtn
          toggleMenu()

    toggleMenu = ->

      if isAnimating
        return false
      isAnimating = true
      if isOpen
        openbtn.className = 'cd-nav-trigger'
        bodyEl.className = ''
        # animate path
        setTimeout (->
          # reset path
          path.attr 'd', initialPath
          isAnimating = false
          return
        ), 300
      else
        bodyEl.className += 'show-menu'
        openbtn.className += ' nav-is-visible'

        # animate path

        path.animate { 'path': pathOpen }, 400, mina.easeinout, ->
          isAnimating = false
          return
      isOpen = !isOpen


    init()

