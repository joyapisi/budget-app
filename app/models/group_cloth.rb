class GroupCloth < ApplicationRecord
  belongs_to :cloth
  belongs_to :group

  after_save :update_group_total_amount

  private

  def update_group_total_amount
    group.total_amount = group.total_amount + item.amount
    group.save
  end
end
