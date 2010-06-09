# detection of some generic platform families
# * :unix (UN*X systems) with distinguished subfamilies: :linux, :osx/:darwin, :bsd, :cygwin
# * :windows with variants :mswin32, :mingw32
# * :java
def ruby_platform_is?(platform)
  ruby_platform = ruby_version?(:<,'1.9.0') ? PLATFORM : RUBY_PLATFORM
  case platform
  when :unix
    ruby_platform =~ /linux|darwin|freebsd|netbsd|solaris|aix|hpux|cygwin/
  when :linux
    ruby_platform =~ /linux/
  when :osx, :darwin
    ruby_platform =~ /darwin/
  when :bsd
    ruby_platform =~ /freebsd|netbsd/
  when :cygwin
    ruby_platform =~ /cygwin/
  when :windows
    ruby_platform =~ /mswin32|mingw32/
  when :mswin32
    ruby_platform =~ /mswin32/
  when :mingw32
    ruby_platform =~ /mingw32/
  when :java
    ruby_platform =~ /java/
  else
    raise RuntimeError, "Invalid platform specifier"
  end ? true : false
end

def if_ruby_platform_is(platform)
  yield if platform_is?(platform)
end
