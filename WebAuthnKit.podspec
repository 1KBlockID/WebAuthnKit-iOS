Pod::Spec.new do |bid|
bid.name                    = 'WebAuthnKit'
bid.version                 = '0.9.61'
bid.summary                 = 'WebAuthn Client and Authenticator Support Library'
bid.description             = <<-DESC
This library provides you a way to handle W3C Web Authentication API (a.k.a. WebAuthN / FIDO 2.0) easily.
                   DESC
bid.homepage                = 'https://github.com/1KBlockID/WebAuthnKit-iOS'
bid.license                 = { :type => "MIT", :file => "LICENSE" }
bid.author                  = { "lyokato" => "lyo.kato@gmail.com" }
bid.source                  = { :git => 'https://github.com/1KBlockID/WebAuthnKit-iOS.git', :tag => bid.version }

bid.ios.deployment_target   = '11.0'
bid.source_files            = "WebAuthnKit/Sources/**/*.swift"

bid.dependency "PromiseKit", "~> 6.13.1"
# bid.dependency "EllipticCurveKeyPair", "~> 2.0.1"
bid.dependency "KeychainAccess", "~> 4.2.1"
bid.dependency "CryptoSwift", "~> 1.3.8"

bid.swift_version = "4.2"

end