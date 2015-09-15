class Foobar
  # Q4 CODE HERE
  def self.baz(array)
    array.map! {|item| item.to_i + 2}
    array.reject!.with_index {|item, i| i.even? || item > 10}.uniq
    sum = 0
    array.each {|i| sum = sum + i }
    return sum
  end
end
