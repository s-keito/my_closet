class AddCategoryIdToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :category_id, :integer
  end
end
