Pod::Spec.new do |s|
  s.name = 'AlamofireNetworkActivityIndicator'
  s.version = '2.2.0'
  s.license = 'MIT'
  s.summary = 'Controls the visibility of the network activity indicator on iOS using Alamofire'
  s.homepage = 'https://github.com/Alamofire/AlamofireNetworkActivityIndicator'
  s.social_media_url = 'http://twitter.com/AlamofireSF'
  s.authors = { 'Alamofire Software Foundation' => 'info@alamofire.org' }

  s.source = { :git => 'https://github.com/Alamofire/AlamofireNetworkActivityIndicator.git', :tag => s.version }
  s.source_files = 'Source/*.swift'

  s.ios.deployment_target = '8.0'

  s.dependency 'Alamofire', '~> 4.5'
end
