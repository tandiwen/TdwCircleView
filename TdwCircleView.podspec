Pod::Spec.new do |spec|
  spec.name         = "TdwCircleView"
  spec.version      = "1.0.0"
  spec.summary      = "A fast integration circle UIView function of custom control"
  spec.description  = "A fast integration circle UIView function of custom control,UIView User Interaction enabled"
  spec.homepage     = "https://github.com/tandiwen/TdwCircleView"
  spec.social_media_url = "https://blog.csdn.net/boildoctor"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "tandiwen" => "46537263@qq.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/tandiwen/TdwCircleView/tree/main/TdwCircleView", :tag => spec.version}
  spec.source_files  = "TdwCircleView/*"
"Sources/DKImagePickerController/*.{h,swift}", "Sources/DKImagePickerController/View/**/*.swift"
  spec.exclude_files = "TdwCircleViewDemo"


end
