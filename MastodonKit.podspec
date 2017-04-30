Pod::Spec.new do |s|
  s.name        = "MastodonKit"
  s.version     = "1.0.8"
  s.summary     = "MastodonKit for Mastodon API"
  s.homepage     = "https://github.com/junjun0516"
  s.license     = { :type => "MIT" }
  s.authors     = { "junjun0516" => "junjunirie0516@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "10.0"
  s.source   = { :git => "https://github.com/junjun0516/MastodonKit.git", :tag => "v#{s.version}" }
  s.source_files = [ "Sources/MastodonKit/*", "Sources/MastodonKit/Foundation/*", "Sources/MastodonKit/Models/*", "Sources/MastodonKit/Resources/*"]
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
  }
end
