module ModalSupport::StateEquivalent
  
  def ==(obj)
    test_equal(obj)
  end
  
  def eql?(obj)
    test_equal(obj)
  end
  
  def ===(obj)
    test_equal(obj)
  end
  
  def hash
    h = 0
    self.instance_variables.each do |var|
      v = self.instance_variable_get(var)
      h ^= v.hash unless v.nil?
    end
    h
  end
  
  private
  
  def test_equal(other)
    return false unless self.class == other.class
    (self.instance_variables + other.instance_variables).uniq.each do |var|
      v1 = self.instance_variable_get(var)
      v2 = other.instance_variable_get(var)
      return false unless v1 == v2
    end
    true
  end
  
end