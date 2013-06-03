class Activity
  include Mongoid::Document

  DEFAULT_ACTIVITY_LIST = %w(
    Art
    Creative Movement
    Math/Science
    Language Development
    Music
    Computer
  )

  field :name, type: String
  field :lessons, type: Array
  field :description, type: String
end