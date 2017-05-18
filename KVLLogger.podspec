#
# Be sure to run `pod lib lint KVLLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
# pod trunk push KVLHelpers.podspec

Pod::Spec.new do |s|
  s.name             = "KVLLogger"
  s.version          = "0.0.1"
  s.summary          = "A simple graphical logger for Swift and Objective-C projects"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
s.description      = <<-DESC
KVLLogger is a simple graphical logger for Swift and Objective-C projects.
                       DESC

  s.homepage         = "https://github.com/smogun/KVLLogger"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Misha" => "mikoval@gmail.com" }
  s.source           = { :git => "https://github.com/smogun/KVLLogger.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'KVLLogger/KVLLogger/**/*'


#s.resource_bundles = {
#    'KVLLogger' => ['Pod/Assets/*.png']
#  }

  # s.public_header_files = 'KVLLogger/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
