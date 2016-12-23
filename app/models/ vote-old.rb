class VoteOld
attr_accessor :choice

def initialize(choice)
  @choice = choice
end

end



  1              3               1
Mike   Antohny   Chris


user = User.new
user.point = 1
user.save!


User.all.each { |user| user.point + user.name}
