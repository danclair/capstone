class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :vehicles, :through => :user
  has_many :comments, :through => :user
end
