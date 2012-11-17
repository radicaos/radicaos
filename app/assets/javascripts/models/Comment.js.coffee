window.Comment = Backbone.Model.extend
  urlRoot: '/comments'
  defaults:
    name: ''
    email: ''
    content: ''
    created_at: new Date()

window.Comments = Backbone.Collection.extend
  url: '/comments'
  model: Comment
  comparator: (comment)->
    date = new Date comment.get('created_at')
    return date.getTime()
