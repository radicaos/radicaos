window.CommentView = Backbone.View.extend

  tagName: "div"

  className: "well well-small media comment"

  initialize: ->
    this.model.on 'change', this.render, this
    this.model.on 'destroy', this.remove, this

  template: _.template """
    <div class="pull-left">
      <img class="media-object" src="http://www.gravatar.com/avatar/<%= MD5(email) %>?s=40&d=retro&r=x" />
    </div>
    <div class="media-body">
      <h5 class="media-heading"><%= name %></h5>
      <p><%= content %></p>
    </div>
  """

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
    this.$el.find('.comment').remove()
    this.collection.forEach this.addOne, this

  render: ->
    this.$el.html '''
      <p class="clearfix">
        <a id="moreComments" class="pull-right btn btn-mini" data-remote="true" href="/comments/more">Carregar mais</a>
      </p>
    '''
    this.addAll();