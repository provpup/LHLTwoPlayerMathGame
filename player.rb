class Player

  @@MAX_LIVES = 3

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    reset
  end

  def reset
    @lives = @@MAX_LIVES
  end

  def dead?
    @lives <= 0
  end

end
