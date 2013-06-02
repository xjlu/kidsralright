class Kra.Views.UsersIndex extends Backbone.View 

  tagName: 'div'
  className: 'user-info'

  # template: _.template($('#user-list-template').html())

  initialize: ->
    @users = new Kra.Collections.Users [
      {name: 'Xinjiang Lu', age: 31}
      {name: 'Yi Lin', age: 26}
      {name: 'Anya Lu', age: 2}
    ]
    @render()

  render: ->
    _self = @
    dust.render("users/index", {users: @users.toJSON()}, (err, output) ->
      _self.$el.html(output)
    )
    # for user in @users.models
    #   dust.render("users/index", user.toJSON(), (err, output) ->
    #     $(_self.el).append(output)
    #   )
    $('#user').html(@el)
    return @