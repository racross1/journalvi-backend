class AddDateToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :date, :string
  end
end
