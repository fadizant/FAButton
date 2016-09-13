#
# Be sure to run `pod lib lint FAButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FAButton'
  s.version          = '0.1.6'
  s.summary          = 'add Thumb image for image loader'

  s.homepage         = 'https://github.com/fadizant/FAButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fadizant' => 'fadizant@hotmail.com' }
  s.source           = { :git => 'https://github.com/fadizant/FAButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FAButton/Classes/**/*'
  
  # s.resource_bundles = {
  #    'FAButton' => ['FAButton/Assets/*.png']
  #  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
