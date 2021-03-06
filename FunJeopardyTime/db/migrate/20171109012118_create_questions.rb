class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.string :difficulty, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
