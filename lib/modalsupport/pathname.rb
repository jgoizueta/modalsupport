require 'pathname'

unless Pathname.instance_methods.any?{|m| m.to_s=='sub_ext'}
  class Pathname
    # This method is available in Ruby >= 1.9.1
    def sub_ext(new_ext)
      # this is how I would do it:
      #   new_ext = ".#{new_ext}" unless new_ext[0,1]=='.'
      #   Pathname.new to_s[/.*(?=\..+$)/]+new_ext
      # but we'll try to be compatible with the standars library method
      Pathname(self.to_s.chomp(extname) + new_ext)
    end
  end
end
