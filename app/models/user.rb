class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :comments, :foreign_key => 'author_id'
  has_many :votes, :dependent => :destroy, :foreign_key => [:user_id, :idea_id]
  has_many :currents, :foreign_key => 'owner_id'

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :encrypted_password, presence: true

  # Provider and uid can be blank but records can not exist that have
  # the same provider + uid combination.
  validates :provider, :allow_blank => true, uniqueness: {
    scope: :uid,
    message: "A user already exists from that provider."
  }
end
