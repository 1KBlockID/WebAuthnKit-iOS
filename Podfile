# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'WebAuthnKitDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod "PromiseKit", "~> 6.13.1"
#  pod "EllipticCurveKeyPair", "~> 2.0"
  pod "KeychainAccess", "~> 4.2.1"
  pod "CryptoSwift", "~> 1.3.8"

  # Pods for WebAuthnKitDemo

  target 'WebAuthnKit' do
    inherit! :search_paths
    pod "PromiseKit", "~> 6.13.1"
#    pod "EllipticCurveKeyPair", "~> 2.0"
    pod "KeychainAccess", "~> 4.2.1"
    pod "CryptoSwift", "~> 1.3.8"
  end

  target 'WebAuthnKitTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

# bitcode enable
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      # set valid architecture
      config.build_settings['VALID_ARCHS'] = 'arm64 armv7 armv7s i386 x86_64'

      # build active architecture only
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'

      config.build_settings['ENABLE_BITCODE'] = 'YES'

      config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'

      cflags = config.build_settings['OTHER_CFLAGS'] || ['$(inherited)']

      cflags << '-fembed-bitcode'

      config.build_settings['OTHER_CFLAGS'] = cflags
      
      # set iOS Deployment Target to 11.0
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.4'
      
      # set build library for distribution to true
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
