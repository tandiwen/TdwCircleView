Pod::Spec.new do |s|
s.name         = "TdwCircleView"
s.version      = "1.0.0"
s.summary      = "A fast integration circle UIView function of custom control"
s.description  = "A fast integration circle UIView function of custom control,UIView User Interaction enabled"
s.homepage     = "https://github.com/tandiwen/TdwCircleView"
s.social_media_url = "https://blog.csdn.net/boildoctor"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "tandiwen" => "46537263@qq.com" }
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/tandiwen/TdwCircleView.git", :tag => s.version}
s.source_files  = "Sources/*.{h,swift}", "Sources/**/*.swift"
s.exclude_files = "TdwCircleViewDemo"
s.requires_arc  = true
s.swift_version = ['5']
end
