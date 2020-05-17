class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def friendly_posted
    created_at.strftime("%B %e, %Y, %l:%M%P")
  end
end
