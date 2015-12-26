def smallest_evenly_divisible(n)
  m = n * n
  while true do
    return m if (1..n).all? {|x| m % x == 0 }
    m = m+1
  end
end

puts smallest_evenly_divisible(15)