class User < ApplicationRecord
  validates :name, :email, presence:true
  validates :name, length:{maximum:50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, length: {maximum:255}, format:{with:VALID_EMAIL_REGEX},
  uniqueness:{case_sensitive:false} #just because email is upcase
  #doesn't mean it's not the same email

end
