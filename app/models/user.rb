require 'digest/md5'

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_by_email(email)
    user = User.where(:email => email).first
  end

  def self.user_exists?(email)
    User.where(:email => email).exists?
  end

  def self.find_or_create_user(access_token)
    data = access_token.info

    if user_exists? data["email"]
      user = User.find_by_email data["email"]
    else
      user = User.create! :email => data["email"],
        :name => data["name"],
        :first_name => data["first_name"],
        :last_name => data["last_name"],
        :password => Devise.friendly_token[0,20]
    end
    return user
  end

  def get_gravtar_image_url
    email_address = self.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    return "https://www.gravatar.com/avatar/#{hash}"
  end

  def get_display_name
    if not self.first_name.nil?
      return self.first_name
    elsif not self.name.nil?
      return self.name
    else
      return self.email
    end
  end
end
