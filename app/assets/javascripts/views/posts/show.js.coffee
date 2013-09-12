class Kra.Views.PostShow extends Backbone.View
  className: 'post'

  render: ->
    _self = @
    dust.render 'posts/show', {model: @model.toJSON()}, (err, output) ->
      _self.$el.html(output)
    return @