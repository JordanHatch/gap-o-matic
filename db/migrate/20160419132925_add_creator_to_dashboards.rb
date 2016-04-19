class AddCreatorToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :creator_id, :integer
    add_foreign_key :dashboards, :users, column: :creator_id
  end
end
