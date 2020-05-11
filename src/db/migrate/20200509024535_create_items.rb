class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :size
      t.string :color
      t.float :price

      t.timestamps
    end
  end
end
