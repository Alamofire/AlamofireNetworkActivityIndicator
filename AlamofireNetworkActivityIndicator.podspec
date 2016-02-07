Pod::Spec.new do |s|
  s.name = 'AlamofireNetworkActivityIndicator'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'AlamofireNetworkActivityIndicator is a component library to Alamofire for controlling the network activity indicator on iOS'
  s.homepage = 'https://github.com/Alamofire/AlamofireNetworkActivityIndicator'
  s.social_media_url = 'http://twitter.com/AlamofireSF'
  s.authors = { 'Alamofire Software Foundation' => 'info@alamofire.org' }

  s.source = { :git => 'https://github.com/Alamofire/AlamofireNetworkActivityIndicator.git', :tag => s.version }
  s.source_files = 'Source/*.swift'

  s.ios.deployment_target = '8.0'

  s.dependency 'Alamofire', '~> 3.2'
end
