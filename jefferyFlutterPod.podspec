#
# Be sure to run `pod lib lint jefferyFlutterPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'jefferyFlutterPod'
  s.version          = '0.1.3'
  s.summary          = 'A test for flutter_pod.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mynameissujie/jefferyFlutterPod.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jeffery' => '379675320@qq.com' }
  s.source           = { :git => 'https://github.com/mynameissujie/jefferyFlutterPod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'jefferyFlutterPod/Classes/**/*'
  s.public_header_files = 'jefferyFlutterPod/Classes/**/*.h'
  s.vendored_frameworks = "jefferyFlutterPod/Framework/*.framework"


end
