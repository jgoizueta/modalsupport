def File.relative_path(path, base=nil)
   base ||= '.'
   casefold = File::ALT_SEPARATOR=='\\'
   base = File.expand_path(base)
   base = base.gsub(File::ALT_SEPARATOR, File::SEPARATOR) if File::ALT_SEPARATOR
   base.downcase! if casefold
   base += File::SEPARATOR unless base[-1,1]==File::SEPARATOR
   xpath = File.expand_path(path)
   xpath = xpath.gsub(File::ALT_SEPARATOR, File::SEPARATOR) if File::ALT_SEPARATOR
   if xpath.size >= base.size
     pre = xpath[0...base.size]
     pre.downcase! if casefold
     if pre == base
       path = xpath[base.size..-1] # skip separator
       # path = '.' if path==''
     end
   end  
  path
end
