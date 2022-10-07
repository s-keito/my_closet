class AddStatusToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :status, :integur, null: false, default: 0
  end
end
