Pod::Spec.new do |s|
  s.name             = "DuckDate"
  s.version          = "1.0.0"
  s.summary          = "NSDate extension for Swift"
  s.homepage         = "https://github.com/appdev-academy/DuckDate.git"
  s.license          = 'MIT'
  s.authors          = { "Maksym Skliarov" => "maksym@appdev.academy",
                         "Yura Voevodin" => "yura@appdev.academy" }
  s.source           = { :git => "https://github.com/appdev-academy/DuckDate.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AppDev_Academy'
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  
  s.source_files = 'DuckDate/Classes/**/*'
  s.frameworks = 'Foundation'
end