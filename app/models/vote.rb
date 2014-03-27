class Vote < ActiveRecord::Base

  belongs_to :idea
  belongs_to :user

  validates :user, uniqueness: {
    scope: :idea,
    message: "A user cannot vote on the same idea twice."
  }
end
