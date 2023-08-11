class Cloth < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :amount, :name, presence: true
end
