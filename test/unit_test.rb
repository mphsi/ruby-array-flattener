require "minitest/autorun"

# Tests using examples in Array#Flatten docs https://apidock.com/ruby/Array/flatten
class TestArrayFlattener < Minitest::Test
  def setup
    # @flattener = ArrayFlattener.new
    s = [ 1, 2, 3 ]           #=> [1, 2, 3]
    t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
    a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
  end

  def test_that_it_flattens_flattened_arrays
    assert_equal ArrayFlattener.new(s).flatten, [1, 2, 3]
  end

  def test_that_it_flattens_nested_arrays
    assert_equal ArrayFlattener.new(t).flatten, [4, 5, 6, 7, 8]
  end

  def test_that_it_flattens_multiple_deep_nested_arrays
    assert_equal ArrayFlattener.new(a).flatten, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def test_that_it_flattens_arrays_to_an_specified_level_of_recursion
    skip "test this later"
    # a = [ 1, 2, [3, [4, 5] ] ]
    # assert_equal ArrayFlattener.new(a, 1).flatten, [1, 2, 3, [4, 5]]
  end
end
