class CreatePrompts < ActiveRecord::Migration[6.1]
  def change
    create_table :prompts do |t|
      t.references :entry, null: false, foreign_key: true
      t.text :prompt
      t.text :response

      t.timestamps
    end
  end
end
