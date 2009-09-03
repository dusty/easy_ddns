Gem::Specification.new do |s| 
  s.name = "easy_ddns" 
  s.version = "0.0.2" 
  s.author = "Dusty Doris" 
  s.email = "github@dusty.name" 
  s.homepage = "http://code.dusty.name" 
  s.platform = Gem::Platform::RUBY 
  s.summary = "DDNS Updater for dnsmadeeasy.com" 
  s.files = Dir["{bin,test,lib}/**/*"]
  s.require_path = "lib" 
  s.has_rdoc = true 
  s.extra_rdoc_files = ["README.txt"]
  s.executables = ['easy_ddns','easy_ips']
  s.rubyforge_project = "none"
end