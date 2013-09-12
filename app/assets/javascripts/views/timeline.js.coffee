class Kra.Views.Timeline extends Backbone.View

  # modeled after todo list
  initialize: ->
    @collection = new Kra.Collections.Posts
    @listenTo(@collection, 'add', @addOne)
    # @listenTo(@collection, 'all', @render)
    @listenTo(@collection, 'reset', @addAll)
    @collection.fetch()

  render: ->
    @postList = new Kra.Views.PostIndex collection: @collection
    @postNew = new Kra.Views.PostNew collection: @collection
    @.$el.append(@postNew.render().el)
    @.$el.append(@postList.render().el)
    return @

  addOne: (post) ->
    post = new Kra.Views.PostShow model: post
    @.$(".post-list").append(post.render().el)