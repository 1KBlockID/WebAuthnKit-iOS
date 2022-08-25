Pod::Spec.new do |s|
  s.name         = "WebAuthnKit"
  s.version      = "2.0.3"
  
  s.summary      = "WebAuthn Client and Authenticator Support Library"
  s.description  = <<-DESC
This library provides you a way to handle W3C Web Authentication API (a.k.a. WebAuthN / FIDO 2.0) easily.
                   DESC
  
  s.homepage = "https://github.com/1KBlockID/WebAuthnKit-iOS"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Kuldeep" => "kuldeep@1kosmos.com" }
  
  s.platform = :ios
  s.ios.deployment_target = '12.0'
  
  s.source = { :git => "https://github.com/1KBlockID/WebAuthnKit-iOS.git", :tag => s.version }
  s.source_files  = "WebAuthnKit/Sources/**/*.swift"
  
  s.framework  = "Foundation", "UIKit", "LocalAuthentication"
  s.dependency "PromiseKit", "~> 6.18.1"
  s.dependency "EllipticCurveKeyPair", "~> 2.0.2"
  s.dependency "KeychainAccess", "~> 4.2.1"
  s.dependency "CryptoSwift", "~> 1.5.1"
  
  s.swift_version = "4.2"

end
