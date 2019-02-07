class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.references :type, foreign_key: true
      t.references :designer, foreign_key: true
      t.integer :quantity
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
