class Goal < ApplicationRecord
  validates :title, :private, :complete, presence: true
  
  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User
end
