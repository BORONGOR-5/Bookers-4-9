class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name：string, :string
  end
end
