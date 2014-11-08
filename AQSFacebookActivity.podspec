Pod::Spec.new do |s|
  s.name         = "AQSFacebookActivity"
  s.version      = "0.1.0"
  s.summary      = "[iOS] UIActivity Class for Facebook"
  s.homepage     = "https://github.com/AquaSupport/AQSFacebookActivity"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AquaSupport/AQSFacebookActivity.git", :tag => "v0.1.0" }
  s.source_files  = "AQSFacebookActivity/Classes/**/*.{h,m}"
  s.resources = ["AQSFacebookActivity/Classes/**/*.png"]
  s.requires_arc = true
  s.platform = "ios", '7.0'

  s.frameworks = "Social"
end