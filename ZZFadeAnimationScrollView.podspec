Pod::Spec.new do |s|
  s.name             = 'ZZFadeAnimationScrollView'
  s.version          = '0.2.1'
  s.summary          = '淘宝二楼，渐变滚动视图效果'
  s.homepage         = 'https://github.com/zhouXiaoR/ZZFadeAnimationScrollView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhouXiaoR' => 'zhouxiaorui@duiba.com.cn' }
  s.source           = { :git => 'https://github.com/zhouXiaoR/ZZFadeAnimationScrollView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files = 'ZZFadeAnimationScrollView/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SDWebImage', '~> 4.0'
end
