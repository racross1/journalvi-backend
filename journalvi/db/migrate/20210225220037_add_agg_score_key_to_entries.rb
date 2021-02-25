class AddAggScoreKeyToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :agg_score_key, :string
  end
end
