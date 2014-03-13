Pod::Spec.new do |s|
  s.name         = "KMKit"
  s.version      = "0.0.1"
  s.summary      = "A library for iOS development include extensions of Foundation and UIKit"
  s.homepage     = "https://github.com/matsuda/KMKit"
  s.license      = 'MIT'
  s.author             = { "matsuda" => "3matsuda@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/matsuda/KMKit.git" }
  # s.source_files  = 'Classes/**/*.{h,m}'
  s.requires_arc = true

  s.default_subspec = 'All'
  s.subspec 'All' do |ss|
    ss.dependency 'KMKit/Foundation'
    ss.dependency 'KMKit/UIKit'
  end
  s.subspec 'Foundation' do |ss|
    ss.source_files = 'Classes/Foundation/**/*.{h,m}'
  end
  s.subspec 'UIKit' do |ss|
    ss.source_files = 'Classes/UIKit/**/*.{h,m}'
  end
end
