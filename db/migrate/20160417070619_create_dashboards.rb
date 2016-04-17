class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string :title, null: false
      t.string :owner
      t.timestamps null: false
    end
  end
end
