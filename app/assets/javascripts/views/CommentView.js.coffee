window.CommentView = Backbone.View.extend
  tagName: "div"

  className: "well well-small comment"

  initialize: ->
    this.model.on 'change', this.render, this
    this.model.on 'destroy', this.remove, this

  template: _.template("<p><strong><%= name %></strong></p><%= content %><time class=\"pull-right\"><%= created_at %></time>")

  render: ->
    this.$el.html this.template(this.model.toJSON())

  remove: ->
    this.$el.remove()

window.CommentsView = Backbone.View.extend
  id: 'comments'

  initialize: ->
    this.collection.on 'add', this.addOne, this
    this.collection.on 'reset', this.addAll, this

  addOne: (comment)->
    commentView = new CommentView
      model: comment

    commentView.render()
    
    this.$el.prepend commentView.el
    commentView.$el.hide().show 'slow'

  addAll: ->
    this.$el.html = ''
    this.collection.forEach this.addOne, this

  render: ->
    this.addAll();