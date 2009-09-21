Gem::Specification.new do |s| 
  s.name = "easy_ddns" 
  s.version = "0.0.3" 
  s.author = "Dusty Doris" 
  s.email = "github@dusty.name" 
  s.homepage = "http://code.dusty.name" 
  s.platform = Gem::Platform::RUBY 
  s.summary = "DDNS Updater for dnsmadeeasy.com" 
  s.has_rdoc = true
  s.files = %w[
    README.txt
    lib/easy_ddns.rb
    bin/easy_ddns
    bin/easy_ips
    test/test_easy_ddns.rb
  ]
  s.extra_rdoc_files = ["README.txt"]
  s.executables = ['easy_ddns','easy_ips']
  s.rubyforge_project = "none"
end