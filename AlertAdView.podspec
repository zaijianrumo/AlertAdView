

Pod::Spec.new do |s|

  s.name         = "AlertAdView"
  s.version      = "1.0.0"
  s.summary      = "弹框广告支持视频图文广告"
  s.description  = <<-DESC
                   "弹框广告"
                   DESC
                   
  s.platform =   :ios, "9.0"
  s.ios.deployment_target = "9.0"

  s.homepage     = "https://github.com/zaijianrumo/AlertAdView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "zaijianrumo" => "2245190733@qq.com" }
  s.source       = { :git => "https://github.com/zaijianrumo/AlertAdView.git", :tag =>  s.version}

  s.source_files            = "ADView/*.{h}" 
  s.resources               = "ADView/ADViewResource.bundle"


end
