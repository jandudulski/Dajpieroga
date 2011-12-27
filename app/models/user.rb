class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :image_url, :firstname, :lastname

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    info = access_token.info

    if user = User.where(email: data.email).first
      user
    else
      User.create!(email: data.email, password: Devise.friendly_token[0, 20])
    end.tap do |user|
      user.firstname = info.first_name
      user.lastname = info.last_name
      user.image_url = info.image
      user.save
    end
  end
end
