class Kra.Views.PostIndex extends Backbone.View

  tagName: 'div'
  className: 'post-list'

  # template: _.template($('#user-list-template').html())

  initialize: ->
    # bootstrap data
    post_data = [
      image_url: "http://cdn.sheknows.com/articles/mom-with-daycare-children.jpg"
      content: "We are going to have a project: cut and paste time!"
    ,
      image_url: "http://lafayettecountyhealth.org/Daycare.jpg"
      content: "play time: do you want to see how it works?"
    ,
      image_url: "http://www.languagesbynancy.com/assets/LbN_Pic-daycare.jpg"
      content: "All come here, kids! We will have an awesome story time!"
    ]
    @posts = new Kra.Collections.Posts post_data
    @render()

  render: ->
    # console.log("PostIndex render")
    _self = @
    dust.render("posts/index", {posts: @posts.toJSON()}, (err, output) ->
      _self.$el.html(output)
    )
    $('#timeline').html(@el)
    return @