class Kra.Models.Post extends Backbone.Model
  schema:
    classroom:
      type: 'Select'
      options: []
    message:
      type: 'TextArea'
      editorAttrs:
        placeholder: "Share with the class..."
        rows: 4
        class: 'input-xxlarge'

  initialize: ->

  url: ->
    base_url = '/posts';
    if (@isNew())
      return base_url;
    else
      return base_url + '/' + this.id
