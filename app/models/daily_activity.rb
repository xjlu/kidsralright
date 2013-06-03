class ActivityTemplate
  include Mongoid::Document
  include Mongoid::Timestamps
  include Tenacity

  t_belongs_to :classroom
  embeds_many :activities

  field :date_of_activity, type: Date
end