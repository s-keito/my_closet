class RemoveCategoryFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :category, :string
  end
end
