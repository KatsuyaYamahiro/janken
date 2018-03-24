class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  
    def self.from_omniauth(auth)
      where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.username = auth["info"]["nickname"]
      end
  end

  def self.new_with_session(_, session)
    super.tap do |user|
      if (data = session['devise.omniauth_data'])
        user.email = data['email'] if user.email.blank?
        user.username = data['name'] if user.username.blank?
        user.facebook_uid = data['facebook_uid'] if data['facebook_uid'] && user.facebook_uid.blank?
        # twitterの判定も先取って記述しておきます
        user.twitter_uid = data['twitter_uid'] if data['twitter_uid'] && user.twitter_uid.blank?
        user.skip_confirmation!
      end
    end
  end
  
end
