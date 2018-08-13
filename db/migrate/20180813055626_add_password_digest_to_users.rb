class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    #password_digest is just a hashed password
    add_column :users, :password_digest, :string
  end
end
