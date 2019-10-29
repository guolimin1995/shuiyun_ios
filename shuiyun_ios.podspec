#
# Be sure to run `pod lib lint shuiyun_ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'shuiyun_ios'
  s.version          = '0.1.2'
  s.summary          = 'A short description of shuiyun_ios.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/guolimin1995/shuiyun_ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zerone' => '913108060@qq.com' }
  s.source           = { :git => 'https://github.com/guolimin1995/shuiyun_ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.subspec 'Core' do |b|
      b.source_files = 'shuiyun_ios/Classes/**/*'
  end

  s.subspec '3rd' do |a|
      a.frameworks = 'StoreKit','MobileCoreServices','WebKit','MediaPlayer','CoreMedia','CoreLocation','AVFoundation','CoreTelephony','SystemConfiguration','AdSupport','CoreMotion','ImageIO'
      a.ios.libraries = 'resolv.9','c++','z'
      a.dependency 'UMCCommon'
      a.dependency 'UMCSecurityPlugins'
      a.dependency 'UMCAnalytics'
      a.vendored_frameworks = ['shuiyun_ios/Assets/GDTActionSDK.framework']
      a.dependency 'Bytedance-UnionAD','2.5.1.2'
      a.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) BYTE_DANCE_ONLY=1'}
  end

  
  # s.resource_bundles = {
  #   'shuiyun_ios' => ['shuiyun_ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
