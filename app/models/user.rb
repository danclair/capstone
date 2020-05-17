class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :vehicles
  has_many :events
  has_many :comments
  belongs_to :vehicle
end
