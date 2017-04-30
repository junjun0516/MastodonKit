Pod::Spec.new do |s|
  s.name        = "MastodonKit"
  s.version     = "1.0.2"
  s.summary     = "MastodonKit for Mastodon API"
  s.license     = { :type => "MIT" }
  s.authors     = { "YourUserName" => "junjunirie0516@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "10.0"
  s.source   = { :git => "https://github.com/akimach/HelloSwift", :tag => "v#{s.version}" }
  s.source_files = "Sources/*.swift"
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
  }
end
