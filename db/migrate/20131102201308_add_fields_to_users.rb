class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :password, :string
    add_column :users, :email, :string
    add_column :users, :permission_level, :int
  end
end
