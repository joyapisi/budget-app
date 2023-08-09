class Group < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :group_clothes, dependent: :destroy
  has_many :clothes, through: :group_clothes, dependent: :destroy, source: 'cloth'

  validates :name, :icon, presence: true
end
