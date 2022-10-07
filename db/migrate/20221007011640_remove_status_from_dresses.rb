class RemoveStatusFromDresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :dresses, :status, :integer
  end
end
