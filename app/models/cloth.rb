class Cloth < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :amount, presence: true
  validates :group, presence: true
end
