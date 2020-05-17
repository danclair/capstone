class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :vehicles, :through => :user
  has_many :comments, :through => :user

  def friendly_date
    date.strftime("%B %e, %Y")
  end

  def friendly_time
    time.strftime("%l:%M%P")
  end
end
