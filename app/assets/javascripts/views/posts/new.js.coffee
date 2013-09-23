class Kra.Views.PostNew extends Backbone.View
  className: "new-post"
  templateName: "posts/new"

  events:
    'submit': 'submit'

  initialize: ->

  render: ->
    @model = new Kra.Models.Post
    @form = new Backbone.Form({model: @model}).render()
    # set options using a collection
    classroom_list = new Kra.Collections.Classrooms()
    _self = @

    classroom_list.fetch
      success: (collection) ->
        _self.form.fields.classroom_id.editor.setOptions(collection)
        _self.form.$el.find("[name=classroom_id]").val(Kra.default_classroom_id)
    dust.render this.templateName, {}, (err, output) ->
      _self.form.$el.append(output)
    _self.$el.html(@form.el)
    return @

  submit: (e) ->
    _self = @
    e.preventDefault()
    @form.commit()
    @model.save {},
      success: (model, response) ->
        # backbone 1.0 is adding {at: 0} to options for unshift
        _self.collection.unshift(model)
        _self.render() # re-render the form, reset the form