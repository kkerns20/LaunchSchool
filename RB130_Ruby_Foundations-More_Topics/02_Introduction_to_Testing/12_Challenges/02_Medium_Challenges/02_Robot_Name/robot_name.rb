class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name() while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    ("A".."Z").to_a.sample(2).join + ("0".."9").to_a.sample(3).join
  end
end

puts Robot.new.name