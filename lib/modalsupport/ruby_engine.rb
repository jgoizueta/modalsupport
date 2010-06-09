# Detect Ruby engine:
# :ruby, :rbx/:rubinius, :jruby/:java, ...
def ruby_engine_is?(engine) # "ruby" "jruby" "rbx"
  engine = {:rubinius=>:rbx, :java=>:jruby}[engine] || engine
  current_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
  engine.to_s == current_engine
end

def if_ruby_engine_is(engine)
  yield if ruby_engine_is?(engine)
end
