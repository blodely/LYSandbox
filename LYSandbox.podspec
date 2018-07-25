# Created By Luo Yu (blodely@gmail.com)

Pod::Spec.new do |s|
	s.name             = 'LYSandbox'
	s.version          = '0.1.0'
	s.summary          = 'LYSandbox is lib for iOS app to use sandbox files.'

	s.description      = <<-DESC
LYSandbox.
Toolbox to manage sandbox files.
Boxes and cats.
					   DESC

	s.homepage         = 'https://github.com/blodely/LYSandbox'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'blodely' => 'blodely@gmail.space' }
	s.source           = { :git => 'https://github.com/blodely/LYSandbox.git', :tag => s.version.to_s }
	s.social_media_url = 'https://weibo.com/blodely'

	s.ios.deployment_target = '8.0'

	s.source_files = 'LYSandbox/Classes/model/*', 'LYSandbox/Classes/**/*'

	# s.resource_bundles = {
	#   'LYSandbox' => ['LYSandbox/Assets/*.png']
	# }

	# s.public_header_files = 'Pod/Classes/model/*', 'Pod/Classes/**/*.h'
	# s.frameworks = 'UIKit', 'MapKit'
	s.frameworks = 'UIKit'

	# s.dependency 'AFNetworking', '~> 2.3'
	s.dependency 'FCFileManager', '~> 1.0.20'

end
