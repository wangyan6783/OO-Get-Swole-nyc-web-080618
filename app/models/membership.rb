class Membership

  @@all = []
  attr_reader :cost
  attr_accessor :lifter, :gym

  def initialize(cost, lifter, gym)
    @cost = cost
    @lifter = lifter
    @gym = gym
    @@all << self
  end

  def self.all
    @@all
  end

end
