class Kra.Views.PostIndex extends Backbone.View

  tagName: 'div'
  className: 'post-list'

  # template: _.template($('#user-list-template').html())

  initialize: ->
    # bootstrap data
    @posts = new Kra.Collections.Posts [
      {image_url: 'http://rootfun.net/images/2012/01/Jennifer-Aniston-2012-2.jpg', content: "Jennifer Aniston"}
      {image_url: 'http://content.foto.mail.ru/mail/anya.lukyanova.98/_answers/i-3.jpg', content: 'Selena Gomez'}
      {image_url: "http://hiclasswallpapers.com/wp-content/uploads/2012/06/natalie-portman-poster-01b99.jpg", content: 'Natalie Portman'}
      {image_url: "http://siguealconejoblanco.com/cine/wp-content/uploads/2012/04/iron-man-3.jpg", content: "Iron Man 3"}
    ]
    @render()

  render: ->
    _self = @
    dust.render("posts/index", {posts: @posts.toJSON()}, (err, output) ->
      _self.$el.html(output)
    )
    $('#timeline').html(@el)
    return @