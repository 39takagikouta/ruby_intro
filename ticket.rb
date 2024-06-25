class Ticket
  attr_accessor :fare, :stamped_at

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    @stamped_at = name
  end
end
