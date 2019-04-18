# todo: add doc
class ArrayFlattener
  attr_reader :array
  def initialize(array)
    @array = array
  end

  def flatten(recursion_level = nil)
    prepare_helper_variables

    is_array_like?(array) ? flat_at_level(array, recursion_level) : array

    flatten_array
  end

  private

  def prepare_helper_variables
    @flat_array     = []
    @flat_array_pos = 0
  end

  def is_array_like?(object)
    object.respond_to?(:size) && object.respond_to?(:each)
  end

  def flat_at_level(array_like_object, recu_level)
    # skip recursion_level usage for now
    array_like_object.each do |element|
      if is_array_like?(element)
        flat_at_level(element, recu_level)
      else
        set_in_flat_array(element)
        increase_flat_array_pos(1)
      end
    end
  end

  def set_in_flat_array(element)
    @flat_array[@flat_array_pos] = element
  end

  def increase_flat_array_pos(step)
    @flat_array_pos += step
  end

  def flatten_array
    @flat_array
  end
end
