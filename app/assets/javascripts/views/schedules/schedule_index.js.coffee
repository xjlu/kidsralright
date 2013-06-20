class Kra.Views.ScheduleIndex extends Backbone.View
  className: 'schedule-list'

  initialize: ->
    # test data for schedules
    @schedules = [
      {id: 6 , name: 'infants'}
      {id: 11, name: 'toddlers-1'}
      {id: 12, name: 'toddlers-2'}
    ]
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