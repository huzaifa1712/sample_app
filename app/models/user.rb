class User < ApplicationRecord
  validates :name, :email, presence:true
  validates :name, length:{maximum:50}
  validates :email, length: {maximum:255}
  #validates :email, uniqueness:true
end
