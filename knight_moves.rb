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
        moves = [[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1]]
        root =  Node.new(position) 
        root_node = [root]
        print "Root : #{root_node}"
        col = position[0]
        row = position[1]
        path = []
        while not root_node.empty? && path.empty?
            parent_node = root_node.shift
            moves.each do |move|
                if is_valid_move?(move, col, row)
                    current = [parent_node.position[0]+move[0], parent_node.position[1]+move[1]]
                    child = Node.new(current, parent_node)
                    parent_node.children.push(child)
                    root_node.push(child)
                    if parent_node.position == destination
                        while not parent_node.nil?
                            path.push(parent_node.position)
                            parent_node = parent_node.parent
                        end
                        return path.reverse
                    end
                end
            end 
        end    
    end  
end
game = ChessGame.new

moves = game.knight_moves([3,3],[4,3])
puts "You made it in #{moves.length-1} moves! Heres your path:"
moves.each{|move| p move}


