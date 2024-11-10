class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    # Si username ya existe en users, comenta esta línea
    add_column :users, :username, :string unless column_exists?(:users, :username)
  end
end
