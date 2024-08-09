Pod::Spec.new do |spec|
  spec.name         = "XJEasyButton"
  spec.version      = "0.1.3"
  spec.summary      = "XJEasyButton"
  spec.description  = <<-DESC
                       一个解放你所有烦恼的Button 支持链式调用，支持渐变+各个方向的圆角，支持block回调事件，支持图片和文字的距离调整，支持增加点击范围，支持内边距.
                       DESC
  
  spec.homepage     = "https://github.com/CocoaJiang/XJButton"
  #spec.license      = { :type => 'MIT', :file => 'XJButton/LICENSE.txt' }
  spec.license      = { :type => 'MIT', :file => '/Users/mac/Desktop/cocoaPods/XJButton/LICENSE.txt' }
  spec.author       = { "CocoaJiang" => "519063099@qq.com" }
  spec.source       = { :git => "https://github.com/CocoaJiang/XJButton.git", :tag => spec.version.to_s }
  
  spec.ios.deployment_target = '12.0'
  spec.source_files = 'XJButton/**/*.{h,m}'
  spec.public_header_files = 'XJButton/**/*.h'
  
end
