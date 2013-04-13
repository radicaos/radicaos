Radicaos.Views.Comments ||= {}

class Radicaos.Views.Comments.CommentView extends Backbone.View
  tagName: "div"

  className: "well well-small media comment"

  template: JST["backbone/templates/comments/comment"]

  render: ->
    $(@el).html @template(@model.toJSON())
    @
