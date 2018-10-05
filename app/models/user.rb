class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :imageci, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imageci, content_type: /\Aimage\/.*\z/
  has_attached_file :imagenit, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagenit, content_type: /\Aimage\/.*\z/

  # before_save :ensure_authentication_token
  #
  # def ensure_authentication_token
  #     if authentication_token.blank?
  #         self.authentication_token = generate_authentication_token
  #     end
  # end
  #
  # private
  #  def generate_authentication_token
  #    loop do
  #      token = Devise.friendly_token
  #      break token unless User.where(authentication_token: token).first
  #    end
  # end
end
