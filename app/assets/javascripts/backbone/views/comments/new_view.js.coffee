Radicaos.Views.Comments ||= {}

class Radicaos.Views.Comments.NewView extends Backbone.View
  template: JST["backbone/templates/comments/new"]

  events:
    "submit #new-comment": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind "change:errors", =>
      @render()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set errors: null

    @collection.create @model.toJSON(),
      wait: true
      success: (comment) =>
        @model = new @collection.model()
        @render()

      error: (comment, jqXHR) =>
        @model.set errors: $.parseJSON(jqXHR.responseText).errors
        

  render: ->
    $(@el).html @template(@model.toJSON())
    @.$("form").backboneLink @model
    @
