class AddStatusToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :status, :integer, null: false, default: 0
  end
end
