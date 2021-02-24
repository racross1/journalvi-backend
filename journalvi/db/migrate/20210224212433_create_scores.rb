class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :prompt, null: false, foreign_key: true
      t.string :sentiment
      t.float :pos_score
      t.float :neg_score
      t.float :neut_score
      t.float :mixed_score

      t.timestamps
    end
  end
end
