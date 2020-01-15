class Chess
    
    
end

class Board
    def initialize 
        @boardGrid =  Array.new(8) {Array.new(8,0)}
    end
    def display
        puts "  _______________________________________________________"
        8.times do |row|
            print " "
            8.times do |col| 
                print "|      "
            end
            puts "|\n"
            print "#{row+1}"
            8.times do |col| 
                print "|  #{@boardGrid[row][col]}   "
            end
            puts "|\n"
            print " "
            8.times do |col| 
                print "|______"
            end
            puts "| "
        end
        puts "     A      B      C      D      E      F      G      H"
    end
end

board = Board.new
board.display
