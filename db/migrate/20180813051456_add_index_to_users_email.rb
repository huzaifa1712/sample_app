class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]

  def change
    #Adds index to email column in users table that must be unique
     #To prevent double user creation - when lots of traffic or user
    #licks submit button twice.
    #File was created using this command: rails generate migration add_index_to_users_email

    add_index :users, :email, unique:true
  end
end
