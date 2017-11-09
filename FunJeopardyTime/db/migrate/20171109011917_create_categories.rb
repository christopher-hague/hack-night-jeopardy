class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
