class User < ApplicationRecord
  before_save{self.email.downcase!} #Callback to downcase email
  #so DB doesn't treat two same email addresses but different case as different
  #e.g foo.bar@example.com and FOO.bAr@example.com( should be treated as same)

  validates :name, :email, presence:true
  validates :name, length:{maximum:50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, length: {maximum:255}, format:{with:VALID_EMAIL_REGEX},
  uniqueness:{case_sensitive:false} #just because email is upcase
  #doesn't mean it's not the same email

end
