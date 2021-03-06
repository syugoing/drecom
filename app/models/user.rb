class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable #, :confirmable
  mount_uploader :avatar, AvatarUploader
  has_many :topics, dependent: :destroy
  has_many :missions
  has_many :goods, foreign_key: "gooder_id", dependent: :destroy
  has_many :gooded_topics, through: :goods, source: :gooded
  has_many :comments, dependent: :destroy

  def self.create_unique_string
     SecureRandom.uuid
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
     user = User.where(provider: auth.provider, uid: auth.uid).first
     unless user
      user = User.new(
         name:     auth.extra.raw_info.name,
         provider: auth.provider,
         uid:      auth.uid,
         email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
         image_url:   auth.info.image,
         password: Devise.friendly_token[0, 20]
         )
      # user.skip_confirmation!
      user.save(validate: false)
     end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
       user = User.new(
         name:     auth.info.nickname,
         image_url: auth.info.image,
         provider: auth.provider,
         uid:      auth.uid,
         email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
         password: Devise.friendly_token[0, 20],
         )
      #  user.skip_confirmation!
       user.save
     end
   user
  end

  def update_with_password(params, *options)
     if provider.blank?
       super
     else
       params.delete :current_password
       update_without_password(params, *options)
     end
  end

  def good!(topic)
    goods.create!(gooded_id: topic.id)
  end

  def gooding?(topic)
    goods.find_by(gooded_id: topic.id)
  end

  def ungood!(topic)
    goods.find_by(gooded_id: topic.id).destroy
  end

end
