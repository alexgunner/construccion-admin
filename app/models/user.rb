class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  default_value_for :role, "Cliente "
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_attached_file :imageci, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :imageci, content_type: /\Aimage\/.*\z/
   has_attached_file :imagenit, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :imagenit, content_type: /\Aimage\/.*\z/
   has_many :carts
   def self.search(search)
     if search
       User.where('name LIKE ?', "%#{search}%")
     else
       User.all.order('id ASC')
     end
   end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:reset_password_token)
    self.reset_password_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

end
