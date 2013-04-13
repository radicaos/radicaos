Radicaos.Views.Comments ||= {}

class Radicaos.Views.Comments.IndexView extends Backbone.View
  id: 'comments'

  template: JST["backbone/templates/comments/index"]

  initialize: ->
    @options.comments.bind 'reset', @addAll, @
    @options.comments.bind 'add', @addOne, @

  addAll: =>
    $(@el).find('.comment').remove()
    @options.comments.each @addOne

  addOne: (comment) =>
    view = new Radicaos.Views.Comments.CommentView
      model : comment
    $(@el).prepend(view.render().el)
    view.$el.hide().show 'slow'

  render: =>
    $(@el).html @template()
    @addAll()
    @
