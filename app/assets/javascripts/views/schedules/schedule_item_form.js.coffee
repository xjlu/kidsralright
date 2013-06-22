class Kra.Views.ScheduleItemForm extends Backbone.View
  className: 'schedule-item-form'

  initialize: ->
    @render()

  render: ->
    _self = @
    dust.render('schedules/itemEdit', @model.toJSON(), (err, output) ->
      _self.$el.html(output)
    )
    return @