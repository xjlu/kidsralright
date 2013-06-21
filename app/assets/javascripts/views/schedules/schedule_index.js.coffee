class Kra.Views.ScheduleIndex extends Backbone.View
  className: 'schedule-list'

  initialize: ->
    @schedules = @options.schedules
    @render()

  render: ->
    _self = @
    dust.render("schedules/index",
      {schedules: @schedules},
      (err, output) ->
        _self.$el.html(output)
    )
    $('#schedules').html(@el)
    return @