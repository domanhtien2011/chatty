class Message < ActiveRecord::Base
  belongs_to :user

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipien, :foreign_key => :recipient_id, class_name: 'User'

  validates_presence_of :body

  def message_time
    created_at.strftime(“%m/%d/%y at %l:%M %p”)
 end
end
