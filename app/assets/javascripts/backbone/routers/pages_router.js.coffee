class Radicaos.Routers.PagesRouter extends Backbone.Router
  routes:
    "about": "about"
    "lyrics": "lyrics"
    "": "about"
    "tour": "tour"
    "contact": "contact"

  about: ->
    @showPage 'about'

  lyrics: ->
    @showPage 'lyrics'

  tour: ->
    @showPage 'tour'

  contact: ->
    @showPage 'contact'

  initialize: ->
    self = @
    $('.navbar .nav a').on 'click', ->
      href = $(@).attr 'href'
      if href[0] == '/'
        res = self.navigate href, true
        return false

  showPage: (page)->
    $('.page').hide 'slow'
    $("##{page}_page").show 'slow'
