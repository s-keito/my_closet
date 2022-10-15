class RemoveCategoryFromDresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :dresses, :category, :integer
  end
end
