begin
  require 'active_support'
rescue LoadError
  puts "ActiveSupport not available. Install it with: gem install activesupport"
end
begin
  require 'hobosupport'
rescue LoadError
  puts "HoboSupport not available. Install it with: gem install hobosupport"
end
require 'modalsupport'
