class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :trainer]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :send_messages, foreign_key: :sender_id, :class_name => "Message"
  has_many :received_messages, foreign_key: :recipient_id, :class_name => "Message"
  scope :all_except, ->(user) { where.not(id: user) }
  before_create :add_user_role
  
  private
    
    def add_user_role
      self.role = 0  
    end
end
