class Radicaos.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    name: null
    email: null
    content: null
    errors: null

class Radicaos.Collections.CommentsCollection extends Backbone.Collection
  model: Radicaos.Models.Comment
  url: '/comments'
  comparator: (comment)->
    date = new Date comment.get('created_at')
    date.getTime()
