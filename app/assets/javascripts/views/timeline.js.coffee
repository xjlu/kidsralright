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

  addOne: (post, collection, options) ->
    post = new Kra.Views.PostShow model: post
    $el = @.$(".post-list")
    if options and options.at is 0
      $el.prepend(post.render().el)
    else
      $el.append(post.render().el)
