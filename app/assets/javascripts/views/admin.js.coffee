class Kra.Views.Admin extends Backbone.View

  initialize: ->
    classroom_list = new Kra.Collections.Classrooms()
    @form = new Backbone.Form
      schema:
        classroom_id:
          title: 'Classroom'
          type: 'Select'
          options: classroom_list
    @form = @form.render()
    # @form.fields.classroom_id.editor.setOptions(classroom_list)
    @render()
  render: ->
    @.$el.append(@form.el)