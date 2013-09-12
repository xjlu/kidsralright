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
    e.preventDefault()
    @form.commit()
    @collection.create @model.toJSON()
    # @post.save()