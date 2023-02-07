class Square
  attr_accessor :name, :visited
  def initialize(name)
    @name = name
    @visited = false
  end
end

def knight_moves(start)
  moves = [[2,1], [2,-1], [1,-2],[1,2],[-1,-2],[-2,-1],[-1,2],[-2,1]].freeze
  possible_moves = []
  moves.each do |move|
    sample = start[0] + move[0]
    sample1 = start[1] + move[1]
    arr = []
    arr << sample if sample >= 1 && sample1 >= 1 && sample <= 8 && sample1 <= 8
    arr << sample1 if sample >= 1 && sample1 >= 1 && sample <= 8 && sample1 <= 8
    possible_moves << arr if arr != []
  end
  possible_moves
end

def knight_travails(start, fin)  
  que = Queue.new
  que << Square.new(start)
  eve_move = []
  parent = []
  final = []
  while 1
    arr = []
    current_pos = que.pop
    current_name = current_pos.name
    pos_moves = knight_moves(current_name)
    if pos_moves.include?(fin)
      que << Square.new(fin)
      eve_move << fin
      parent << current_name
      break
    end
    pos_moves.each do |move|
      que << Square.new(move)
      if !eve_move.include?(move)
      arr << move
      eve_move << move
      parent << current_name 
      end
    end
  end
  final << fin
  while 1
    ind = eve_move.index(final[final.length-1])
    prev = parent[ind]
    if prev == start
      final << prev
      break
    end
    final << prev
  end
  final.reverse
end


b = knight_travails([1,2], [8,8])
p b