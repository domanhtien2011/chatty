class Message < ActiveRecord::Base
  # belongs_to :user, foreign_key: :recipient_id

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  validates_presence_of :body

end
