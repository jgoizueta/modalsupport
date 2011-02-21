# Helpers to detect Ruby versions

unless defined? Gem
  require 'rubygems'
end

# Compare the Ruby version with a version string
def ruby_version?(cmp, v)
  Gem::Version.create(RUBY_VERSION.dup).send(cmp, Gem::Version.create(v))
end

# ruby_version_between?(v1,v2) == ruby_version?(:>=,v1) && ruby_version?(:<=,v2)
def ruby_version_between?(v1, v2)  
  (Gem::Version.create(v1)..Gem::Version.create(v2)).include?(Gem::Version.create(RUBY_VERSION))
end

# ruby_version_between?(v1,v2) == ruby_version?(:>=,v1) && ruby_version?(:<,v2)
def ruby_version_between_ex?(v1, v2)  
  (Gem::Version.create(v1).-.Gem::Version.create(v2)).include?(Gem::Version.create(RUBY_VERSION))
end

# Execute code conditinally on Ruby version:
#    if_ruby_version :>=, '1.9.2' do
#      ...
#    end
def if_ruby_version(cmp, v)
  yield if ruby_version?(cmp, v)
end

def if_ruby_version_between(v1, v2)  
  yield if ruby_version_between?(v1, v2)
end

def if_ruby_version_between_ex(v1, v2)  
  yield if ruby_version_between_ex?(v1, v2)
end

def ruby_19(&blk)
  if_ruby_version :>=, '1.9.0', &blk
end

def ruby_18(&blk)
  # if_ruby_version :<, '1.9.0', &blk
  if_ruby_version_between_ex '1.8.0', '1.9.0'
end
