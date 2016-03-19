class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { mininum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: { maximum: 105 },
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships, dependent: :destroy
  has_many :inverse_friendships,  :class_name => "Friendship", :foreign_key => "friend_id" , dependent: :destroy
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, dependent: :destroy

  # has_many :messages, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', :foreign_key => "sender_id", dependent: :destroy
  has_many :received_messages, class_name: 'Message',:foreign_key => "recipient_id", dependent: :destroy

  mount_uploader :image_url, ImageUploader

  def to_s
    username
  end

end
