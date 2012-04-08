class GameOfLife
  attr_accessor :lives
  def initialize(lives)
    init(lives)
  end
  
  def init(lives)
    @lives = {}
    lives.each{|point| @lives[point] = point}
  end
  
  def next
    next_generation = []
    @lives.each_value{|point|
      #birth
      neighbors_at(point).each{|neighbor|
        if (@lives[neighbor].nil? && count_neighbors_at(neighbor) == 3)
          next_generation.push neighbor
        end
      }
    
      #survival
      if [2, 3].include?(count_neighbors_at(point))
        next_generation.push point
      end
    }
    init(next_generation)
  end
  
  def count_neighbors_at(point)
    neighbors_at(point).map{|neighbor| @lives[neighbor]}.compact.size
  end
  
  def neighbors_at(point)
    x = point[0]
    y = point[1]
    return [[x - 1, y - 1], [x, y - 1], [x + 1, y - 1], [x - 1, y], [x + 1, y],
        [x - 1, y + 1], [x, y + 1], [x + 1, y + 1]]
  end
end
