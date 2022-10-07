class AddIsStatusToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :is_status, :boolean, default: true
  end
end
