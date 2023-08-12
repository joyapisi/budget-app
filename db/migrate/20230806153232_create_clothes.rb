class CreateClothes < ActiveRecord::Migration[7.0]
  def change
    create_table :clothes do |t|
      t.string :name
      t.integer :user_id
      t.integer :group_id
      t.integer :author_id
      t.decimal :amount

      t.timestamps
    end
  end
end
