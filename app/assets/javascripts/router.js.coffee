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

    prepareDownload()

    comments = new Comments()
    comments.fetch()

    commentsView = new CommentsView
      collection: comments

    commentsView.render()
    

    $('#comments_container').append(commentsView.el)

    $('#new_comment').submit ->
      comment = new Comment()
      _.each ['name', 'email', 'content'], (field)->
        comment.set field, $("#comment_#{field}").attr('value')
        $("#comment_#{field}").attr('value', '')

      _.each ['recaptcha_challenge_field', 'recaptcha_response_field'], (field)->
        comment.set field, $("##{field}").attr('value')

      if comment.save()
        comments.add comment
      else
        alert 'Ops! Parece que existe um erro no seu comentário. Tente novamente.'
        _.each ['name', 'email', 'content'], (field)->
          $("#comment_#{field}").attr('value', comment.get(field))

      return false

  showPage: (page)->
    $('.page').hide('slow')
    $("##{page}_page").show('slow')
