def solution(x, arr)
  passable = Array.new(x) { false }  #=> [false, false, false, false, false]
  uncovered = x                      #=> 5

  arr.each_with_index do |position, minutes|
    unless passable[position - 1]
      passable[position - 1] = true
      uncovered -= 1
      return minutes if uncovered == 0
    end
  end

  -1
end

puts solution(5, [1, 3, 1, 4, 2, 3, 5, 4])