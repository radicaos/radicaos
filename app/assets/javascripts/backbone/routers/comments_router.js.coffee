class Radicaos.Routers.CommentsRouter extends Backbone.Router
  initialize: ->
    @comments = new Radicaos.Collections.CommentsCollection()
    @comments.fetch
      success: =>
        @index_view = new Radicaos.Views.Comments.IndexView(comments: @comments)
        $("#comments").html @index_view.render().el

        @form_view = new Radicaos.Views.Comments.NewView(collection: @comments)
        $("#comment_form").html @form_view.render().el