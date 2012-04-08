require_relative 'GameOfLife'
class Terminal
  def initialize(width, height)
    @width = width
    @height = height
    #a = [[5, 7], [6, 7], [7, 7], [8, 7], [9, 7], [10, 7], [11, 7], [12, 7], [13, 7], [14, 7]]
    a = [[5, 5], [6, 5], [5, 6], [6, 6], [6, 7], [6, 8], [6, 9], [5, 10], [4, 10], [4, 9], [4, 8],
         [8, 5], [9, 5], [8, 6], [9, 6], [8, 7], [8, 8], [8, 9], [9, 10], [10, 10], [10, 9], [10, 8]
    ]
    @g = GameOfLife.new(a)
  end

  def draw 
    for i in 1..@height
      p (1..@width).map{|j|
        @g.lives[[j, i]].nil? ? " ": "@"
      }.join(" ")
    end
    @g.next
  end
end

c = Terminal.new(25, 15)
100.times.each{
  c.draw
  sleep 0.1
}
