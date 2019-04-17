# todo: add doc
class ArrayFlattener
  attr_reader :array
  def initialize(array)
    @array = array
  end

  def flatten
    array
  end
end
