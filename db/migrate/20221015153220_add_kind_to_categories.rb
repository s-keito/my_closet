class AddKindToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :kind, :string
  end
end
