# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

resizeSteps = () ->
  if $('.steps-form__step-next-btn').eq(0).is(':visible')
    viewportHeight = $(window).height()
    $('.steps-form__step').each ->
      stepHeight = $(this).height()
      if stepHeight < viewportHeight
        $(this).height(viewportHeight)

$ ->
  if $('body').hasClass('users') and $('body').hasClass('new')
    resizeSteps()
  $(window).on 'resize', () ->
    resizeSteps()
  $('.steps-form__step-next-btn input').on 'click', () ->
    stepPosition = $(this).parents('.steps-form__step').first().next().offset().top
    $("html, body").animate({scrollTop:stepPosition}, 750)
