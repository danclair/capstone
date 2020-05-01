class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :make
  belongs_to :vehicle_model
  belongs_to :trim
end
