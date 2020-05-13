class Event < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  belongs_to :user
  has_many :event_users
  has_many :users, through: :event_users
  has_many :comments
  # make a method that loops through users and grabs their vehicles

  def friendly_date
    date.strftime("%B %e, %Y")
  end

  def friendly_time
    time.strftime("%l:%M%P")
  end
end
