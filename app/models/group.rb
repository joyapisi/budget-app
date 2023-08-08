class Group < ApplicationRecord
  belongs_to :user
  has_many :cloth

  validates :name, presence: true
  validates :icon, presence: true, uniqueness: true
end
