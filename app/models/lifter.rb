class Lifter

  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def membership
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    membership.map do |membership|
      membership.gym
    end
  end

  def self.average_lift
    total = Lifter.all.reduce(0) do |sum, lifter|
      sum + lifter.lift_total
    end

    (total.to_f / Lifter.all.length).round

  end

  def total_cost
    membership.reduce(0) do |total, membership|
      total + membership.cost
    end
  end

  def sign_up(cost, gym)
    Membership.new(cost, self, gym)
  end

end
