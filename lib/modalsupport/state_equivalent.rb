module StateEquivalent
  def ==(obj); test_equal(obj); end
  def eql?(obj); test_equal(obj); end
  def ===(obj); test_equal(obj); end
  def hash
    h = 0
    self.instance_variables.each do |var|
      v = self.instance_eval var
      h ^= v.hash unless v.nil?
    end
    h
  end

  private
  def test_equal(obj)
    return false unless self.class == obj.class
    (self.instance_variables + obj.instance_variables).uniq.each do |var|
      v1 = self.instance_eval var
      v2 = obj.instance_eval var
      return false unless v1 == v2
    end
    true
  end
end
 
