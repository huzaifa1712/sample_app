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
  has_secure_password

  validates :password, presence: true, length: {minimum:6}

  #Static method for getting the hash digest of a given string(password_digest). Static so can be used everywhere.
  def User.digest(string)
    #Using a high cost means higher computation time, but more secure hash.
    #We want to use a lower cost in tests but higher in production
    #This line of code does that. if .min_cost? returns true, uses Engine::MIN_COST(assigned to cost)
    #else, assigns normal production cost
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string,cost:cost)
  end
end
