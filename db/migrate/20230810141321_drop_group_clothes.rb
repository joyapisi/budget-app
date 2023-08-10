class DropGroupClothes < ActiveRecord::Migration[7.0]
  def change
    drop_table :group_clothes
  end
end
