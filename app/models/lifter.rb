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

  def self.sum(arr)
    sum = 0

    arr.each do |num|
      sum += num
    end
    sum
  end

  def self.avg(arr)
    (sum(arr).to_f / arr.length).round
  end

  def self.average_lift
    lift_arr = Lifter.all.map do |lifter|
      lifter.lift_total
    end
    avg(lift_arr)
  end

  def total_cost
    cost_arr = membership.map do |membership|
      membership.cost
    end
    Lifter.sum(cost_arr)
  end

  def sign_up(cost, gym)
    Membership.new(cost, self, gym)
  end

end
