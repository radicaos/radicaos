window.Radicaos = Backbone.Router.extend
  routes:
    "about": "about"
    "lyrics": "lyrics"
    "": "about"
    "tour": "tour"
    "contact": "contact"

  about: ()->
    this.showPage 'about'

  lyrics: ()->
    this.showPage 'lyrics'

  tour: ()->
    this.showPage 'tour'

  contact: ()->
    this.showPage 'contact'

  start: ()->
    _this = this
    $("a").live "click", (e)->
      href = $(this).attr "href";
      if href[0] == '/'
        res = _this.navigate href, true
        return false;

    Backbone.history.start
      pushState: true

  showPage: (page)->
    $('.page').hide('slow')
    $("##{page}_page").show('slow')
