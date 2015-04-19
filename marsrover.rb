class Commander
  def initialize
    print "Enter plateau size:"
    @plateau = Plateau.new(gets.chomp)
    #TODO: remove rover obj
    # @rover = Rover.new(0,0,"N")



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

    draw_plateau(plateau_size)

  end

  def draw_plateau(plateau_size)
    system("clear")

    #Split the input
    r = plateau_size.split
    rows = r[0].to_i
    columns = r[1].to_i

    puts "Plateau of #{rows}X#{columns} is created..."

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

          # if c == @rover.x-1 && r == @rover.y
          #   print "*"
          # end

        end

      end


      print "\n"
    }

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
