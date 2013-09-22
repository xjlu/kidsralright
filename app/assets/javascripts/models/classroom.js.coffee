class Kra.Models.Classroom extends Backbone.Model
  toString: ->
    return this.get("name")