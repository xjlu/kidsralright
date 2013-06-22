class Kra.Views.ScheduleIndex extends Backbone.View
  # the schedule dropdown list
  className: 'schedule-list'
  events:
    "change select": "scheduleSelected"

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
    $('#schedule-view').html(@el)
    @renderItems()
    @renderItemForm()
    return @

  scheduleSelected: (e) ->
    console.log("schedule selected")
    selected = $(e.currentTarget).find(":selected");
    console.log(selected.val());

  renderItems: ->
    @items = [
      id: 1
      start_time: "08:00 AM"
      end_time: "08:15 AM"
      description: "Morning stride rite"
    ,
      id: 2
      start_time: "08:15 AM"
      end_time: "08:55 AM"
      description: "Free play time"
    ,
      id: 3
      start_time: "08:55 AM"
      end_time: "09:00 AM"
      description: "Wash hands, and get ready for morning snack"
    ,
      id: 4
      start_time: "09:00 AM"
      end_time: "09:30 AM"
      description: "Morning snack time"
    ]

    @itemCollection = new Kra.Collections.ScheduleItems(@items)
    itemCollectionView = new Kra.Views.ScheduleItemList(
      {collection: @itemCollection}
    )
    @.$el.append(itemCollectionView.el)

  renderItemForm: ->
    item = new Kra.Models.ScheduleItem
    itemForm = new Kra.Views.ScheduleItemForm({model: @itemCollection.at(0)})
    @.$el.append(itemForm.el)