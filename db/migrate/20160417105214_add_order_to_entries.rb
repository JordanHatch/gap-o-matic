class AddOrderToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :order, :integer, default: 0
  end
end
