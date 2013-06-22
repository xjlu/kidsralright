class Kra.Views.ScheduleItem extends Backbone.View
  className: 'schedule-item'
  events:
    "click": "onClick"

  initialize: ->
    @render()

  render: ->
    _self = @
    dust.render('schedules/itemShow',
      @model.toJSON(),
      (err, output) ->
        _self.$el.html(output)
    )
    return @

  onClick: (e) ->
    alert("You have selected item #" + @model.id)