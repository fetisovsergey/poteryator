class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :thing
  
  default_scope -> { order('created_at DESC') }

  validates :content, presence: true, length: { in: 2..1000 }
  validates :thing_id, presence: true
  validates :user_id, presence: true 
end
