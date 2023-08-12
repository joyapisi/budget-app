class Group < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :clothes

  validates :name, :icon, presence: true
end
