class Kra.Views.PostNew extends Backbone.View
  className: "new-post"

  events:
    'submit': 'submit'

  initialize: ->
    @post = new Kra.Models.Post
    @form = new Backbone.Form({model: @post}).render()

  render: ->
    _self = @
    dust.render("posts/new", {}, (err, output) ->
      _self.form.$el.append(output)
    ) # append the button to the end of the form
    _self.$el.html(@form.el)
    return @

  submit: (e) ->
    e.preventDefault()
    @form.commit()
    post_list = new Kra.Collections.Posts
    post_list.fetch()
    post = post_list.create({
      message: @post.message
    })
    # @post.save()