class Resource
  include Mongoid::Document
  include Mongoid::Timestamps

  field :filename, type: String
  field :type, type: String

  embeds_many :downloads

  validates_presence_of :filename, :type
  validates_uniqueness_of :filename
end
