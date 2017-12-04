Pod::Spec.new do |s|
  s.name         = "CrashPrevention"
  s.version      = "1.0.1"
  s.summary      = "阻止一些简单bug，防止程序crash，比如：数组越界"
  s.homepage     = "https://github.com/hwzss/CrashPrevention"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { 'hwzss' => '1833361588@qq.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/hwzss/CrashPrevention.git" , :tag => s.version }
  s.source_files =  'CrashPrevention/CrashPrevention/*/*.{h,m}'
  s.requires_arc = true
end
