
Pod::Spec.new do |spec|

  spec.name         = "ExtensionDateTime"
  spec.version      = "1.0.0"
  spec.summary      = "Convert Date Time"
  spec.description  = "This is an extension convert date time."
  spec.homepage     = "https://github.com/namvq/ExtensionDateTime"
  spec.license      = "MIT"
  spec.author       = { "vuqnangnam" => "namvuquang@vccorp.vn" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/namvq/ExtensionDateTime.git", :tag => "1.0.0" }
  spec.source_files  = "ExtensionDate"
  spec.ios.deployment_target  = '12.0'
  spec.swift_version = "5.0"
end
