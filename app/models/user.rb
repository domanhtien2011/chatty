class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships, dependent: :destroy
  has_many :inverse_friendships,  :class_name => "Friendship", :foreign_key => "friend_id" , dependent: :destroy
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, dependent: :destroy

  # has_many :messages, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', :foreign_key => "sender_id", dependent: :destroy
  has_many :received_messages, class_name: 'Message',:foreign_key => "recipient_id", dependent: :destroy

  def to_s
    username
  end
end
