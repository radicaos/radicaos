$ ->
  if $('#index_page_container').length > 0
    window.comments_router = new Radicaos.Routers.CommentsRouter()
    window.pages_router = new Radicaos.Routers.PagesRouter()
    Backbone.history.start
      pushState: true