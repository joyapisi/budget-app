class Group < ApplicationRecord
  belongs_to :user
  has_many :clothes

  validates :icon, presence: true, uniqueness: true
end
