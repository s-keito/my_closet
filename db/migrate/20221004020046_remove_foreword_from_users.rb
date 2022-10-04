class RemoveForewordFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :foreword, :text
  end
end
