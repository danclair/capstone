class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def friendly_posted
    created_at.strftime("%B %e, %Y at %l:%M%P")
  end
end
