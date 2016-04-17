class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :dashboard, index: true
      t.string :title, null: false
      t.string :description
      t.integer :percent, null: false
      t.timestamps null: false
    end
  end
end
