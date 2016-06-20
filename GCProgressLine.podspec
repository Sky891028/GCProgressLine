Pod::Spec.new do |s|

s.name          = "GCProgressLine"
s.version       = "0.0.1"
s.license       = "LICENSE"
s.summary       = "Fast encryption string used on iOS, which implement by Objective-C."
s.homepage      = "https://github.com/Sky891028/GCProgressLine"
s.author        = { "sky891028" => "sky891028@gmail.com" }
s.source        = { :git => "https://github.com/Sky891028/GCProgressLine.git", :tag => "0.0.1" }
s.requires_arc  = true
s.description   = <<-DESC
Fast encryption string, the current support for MD5 (16, 32), Sha1, Base64
DESC
s.source_files  = 'GCProgressLine/**/*.{h,m}'
s.platform      = :ios, '7.0'

end