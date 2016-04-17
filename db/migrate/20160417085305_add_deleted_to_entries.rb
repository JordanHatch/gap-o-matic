class AddDeletedToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :deleted, :boolean, default: false
  end
end
