class AddForewordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :foreword, :text
  end
end
