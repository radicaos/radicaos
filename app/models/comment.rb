class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :content, type: String
  field :ip, type: String

  validates_presence_of :name, :email, :content, :ip
  validates_length_of :content, maximum: 6_000
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
