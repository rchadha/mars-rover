class Commander
  def initialize
    print "Enter plateau size:"
    @plateau = Plateau.new("9 9")
    #Place rover on plateau
    @rover = Rover.new(0,0,"N")
    @rover.position
    @plateau.position_rover_on_plateau(@rover)

    print "Position the rover:"
    @rover.set_position("1 2 N")
    print "Instructions for the rover to move and turn:"
    @rover.read_instruction("LMLMLMLMM")
    @rover.position
    @plateau.position_rover_on_plateau(@rover)

    # print "Position the rover:"
    # @rover.set_position(gets.chomp)
    # print "Instructions for the rover to move and turn:"
    # @rover.read_instruction(gets.chomp)
    # @rover.position
    # @plateau.position_rover_on_plateau(@rover)

    # @rover.x = 1
    # @rover.y = 2
    # @rover.o = "N"
    # @rover.read_instruction("LMLMLMLMM")
    # prompt_input
    # @rover.position
    #
    # @rover.x = 3
    # @rover.y = 3
    # @rover.o = "E"
    # @rover.read_instruction("MMRMMRMRRM")
    # prompt_input
    # @rover.position
  end


end

class Plateau
  def initialize (plateau_size)
    coordinates = plateau_size.split
    @x = coordinates[0].to_i
    @y = coordinates[1].to_i
  end
  attr_accessor :x, :y


  def position_rover_on_plateau(rover)
    # system("clear")

    rows = @y
    columns = @x

    range = rows..0

    (range.first).downto(range.last).each { |r|
      print r
      if r == 0
        for j in 1..columns do
          if j == 1
            print " #{j} "
          else
            print "#{j} "
          end

        end
      else
        for c in 0..columns do

          if c == columns
            print "|"
          else
            print "|_"
          end

          if c == rover.x-1 && r == rover.y
            print "\033[5m\033[1m\033[32m*\033[0m"
          end

        end

      end


      print "\n"
    }

  end

  def green
    "\033[32m*\033[0m"
  end
end

class Rover
  def initialize(x, y, o)
    @x = x.to_i
    @y = y.to_i
    @o = o.capitalize
  end
  attr_accessor :x, :y, :o

  def position
    puts "The rover is at position #{@x}, #{@y} and its orientation is #{@o}."
  end

  def set_position(position)
    p = position.split
    @x = p[0].to_i
    @y = p[1].to_i
    @o = p[2]

  end

  def move_forward
    case @o
      when "N"
        @y += 1
      when "E"
        @x += 1
      when "S"
        @y -= 1
      when "W"
        @x -= 1
    end
  end

  def turn(direction)
    case @o
      when "N"
        @o = direction == "R" ? "E": "W"
      when "E"
        @o = direction == "R" ? "S": "N"
      when "S"
        @o = direction == "R" ? "W": "E"
      when "W"
        @o = direction == "R" ? "N": "S"
    end
  end

  def read_instruction(input)
    input.split('').each do |i|
      i = i.capitalize
      turn(i) if i == "L" || i == "R"
      move_forward if i == "M"

    end
  end

end


# rover1 = Rover.new(0,0,"N")
# rover1 =
nasa = Commander.new
