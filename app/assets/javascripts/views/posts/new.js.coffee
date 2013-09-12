class Kra.Views.PostNew extends Backbone.View
  className: "new-post"

  events:
    'submit': 'submit'

  initialize: ->
    @model = new Kra.Models.Post
    @form = new Backbone.Form({model: @model}).render()

  render: ->
    _self = @
    dust.render "posts/new", {}, (err, output) ->
      _self.form.$el.append(output)
    _self.$el.html(@form.el)
    return @

  submit: (e) ->
    _self = @
    e.preventDefault()
    @form.commit()
    @model.save {},
      success: (model, response) ->
        # backbone 1.0 is adding {at: 0} to options for unshift
        _self.collection.unshift(model)
