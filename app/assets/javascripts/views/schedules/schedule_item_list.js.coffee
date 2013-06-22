class Kra.Views.ScheduleItemList extends Backbone.View
  className: 'schedule-item-list'

  initialize: ->
    @render()

  render: ->
    _self = @
    for item in @collection.models
      schedule = new Kra.Views.ScheduleItem({model: item})
      _self.$el.append(schedule.el)
    return @