class ActivityTemplate
  include Mongoid::Document
  include Mongoid::Timestamps
  include Tenacity

  t_belongs_to :classroom
  embeds_many :activities
end