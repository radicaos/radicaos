class Download
  include Mongoid::Document
  include Mongoid::Timestamps

  field :ip, type: String

  embedded_in :resource

  validates_presence_of :ip
end
