class Node        
    attr_accessor :position, :parent, :children
        def initialize (position, parent = nil, children = [])
            @position = position
            @parent = parent
            @children = []
        end

end

class ChessGame
    def initialize
        board = Board.new
        #board.display
    end

    class Board
        def initialize 
            @boardGrid =  Array.new(8) {Array.new(8,0)}
        end
        def display
            counter = 8
            puts "  _______________________________________________________"
            8.times do |row|
                print " "
                8.times do |col| 
                    print "|      "
                end
                puts "|\n"
                print "#{counter}"
                counter -=1
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

    def is_valid_move?(move, col, row)
        return ((move[0]+col) > -1) && ((move[0]+col) < 8) && ((move[1]+row) > -1) && ((move[1]+row) < 8)
    end


    def knight_moves(position, destination)
        moves = [[-1,2][1,2][2,1][2,-1][1,-2][-1,-2][-2,-1][-2,1]]
        col = position[0]
        row = position[1]
        
        moves.each do |move|
            if is_valid_move?(move, col, row)
                node=Node.new()
            end
        end
        
        
        

   
    end
    
end
game = ChessGame.new




