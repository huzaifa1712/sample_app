class User
  attr_accessor :email, :first, :last

  def initialize(attributes = {})
    @first = attributes[:first]
    @last = attributes[:last]

    @email = attributes[:email]
  end

  def full_name
    @first + " " + @last
  end

  def alphabetical_name
    return @last + ',' + @first
  end

  def formatted_email
    "#{full_name} " + "<#{@email}>"
  end
end
