class Kra.Views.PostShow extends Backbone.View

  className: 'post'
  events:
    'hover': 'showDelete'
    'click .delete': "handleDelete"

  render: ->
    _self = @
    data =
      message: @model.get("message")
      created_at: moment(@model.get("created_at")).format("ddd, MMM Do YYYY HH:MM a")

    dust.render 'posts/show', data, (err, output) ->
      _self.$el.html(output)
    return @

  showMe: ->
    alert(@model.get("id"));

  showDelete: ->
    $el.find(".meta-post ul").append("<li>delete</li>")

  handleDelete: (e) ->
    e.preventDefault()
    r = confirm("Do you want to delete this post?")
    if r is true
      _self = @
      @model.destroy
        success: (model, response) ->
          _self.remove()