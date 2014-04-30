class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :omniauthable, :omniauth_providers => [:twitter, :facebook]

  has_many :comments, :foreign_key => 'author_id'
  has_many :votes, :dependent => :destroy, :foreign_key => [:user_id, :idea_id]
  has_many :currents, :foreign_key => 'owner_id'

  validates :email, uniqueness: true, allow_blank: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :encrypted_password, presence: true

  # Provider and uid can be blank but records can not exist that have
  # the same provider + uid combination.
  validates :provider, :allow_blank => true, uniqueness: {
    scope: :uid,
    message: "A user already exists from that provider."
  }

  validates_acceptance_of :terms_of_use, :allow_nil => false, :if => 'new_record?'

  def self.find_by_oauth(provider, uid, info)
    find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name     = info[:nickname]
      if info[:email]
        user.email  = info[:email]
      end
      user.password = Devise.friendly_token
      user.provider = provider
      user.uid      = uid

      user.confirm!
    end
  end

  protected

    # Override Devise's email requirement check. Devise requires an
    # email by default, but some oauth providers (Twitter, etc) don't
    # provide user emails. Instead of always returning true, return
    # false when a user record has a provider and a uid.
    def email_required?
      true unless provider? && uid?
    end
end
