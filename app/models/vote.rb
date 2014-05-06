class Vote < ActiveRecord::Base
  self.primary_keys = :idea_id, :user_id

  belongs_to :idea
  belongs_to :user

  validates :value, presence: true
  validates :idea_id,  presence: true
  validates :user_id,  presence: true, uniqueness: {
    scope: :idea_id,
    message: 'A user cannot vote on the same idea twice.'
  }
end
