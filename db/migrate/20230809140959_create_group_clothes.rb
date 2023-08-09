class CreateGroupClothes < ActiveRecord::Migration[7.0]
  def change
    create_table :group_clothes do |t|
      t.references :cloth, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
