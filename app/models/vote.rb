class Vote < ActiveRecord::Base

  self.primary_keys = :idea_id, :user_id

  belongs_to :idea
  belongs_to :user

  validates :user, uniqueness: {
    scope: :idea,
    message: "A user cannot vote on the same idea twice."
  }
end
