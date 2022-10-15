class RemoveNameFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :name, :string
  end
end
