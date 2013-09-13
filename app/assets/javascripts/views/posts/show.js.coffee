class Kra.Views.PostShow extends Backbone.View
  className: 'post'

  render: ->
    _self = @
    data =
      message: @model.get("message")
      created_at: moment(@model.get("created_at")).format("ddd, MMM Do YYYY HH:MM a")

    dust.render 'posts/show', data, (err, output) ->
      _self.$el.html(output)
    return @