class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.string :image
      t.text :info

      t.timestamps
    end
  end
end
