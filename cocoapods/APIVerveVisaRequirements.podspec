Pod::Spec.new do |s|
  s.name             = 'APIVerveVisaRequirements'
  s.version          = '1.2.3'
  s.summary          = 'Visa Requirements tells you what a passport holder needs to enter another country: no visa, an electronic travel authorization, an...'
  s.description      = <<-'DESC'
Visa Requirements tells you what a passport holder needs to enter another country: no visa, an electronic travel authorization, an eVisa, a visa on arrival, a visa arranged in advance, or entry restricted. It also returns the allowed stay in days where one is set. Paid plans can list every destination for one passport.

This iOS/macOS SDK provides a convenient way to access the Visa Requirements from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/visarequirements?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/visarequirements-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveVisaRequirements/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
