Pod::Spec.new do |s|
  s.name         = 'Jccp'
  s.version      = '1.0'
  s.license      =  :type => '<#License#>'
  s.homepage     = '<#Homepage URL#>'
  s.authors      =  '<#Author Name#>' => '<#Author Email#>'
  s.summary      = '<#Summary (Up to 140 characters#>'

# Source Info
  s.platform     =  :ios, '<#iOS Platform#>'
  s.source       =  :git => '<#Github Repo URL#>', :tag => '<#Tag name#>'
  s.source_files = '<#Resources#>'
  s.framework    =  '<#Required Frameworks#>'

  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod 'CBIntrospect', '~> 0.4.2'
  s.dependencies =	pod 'AFNetworking', '~> 2.0.3'
  s.dependencies =	pod 'OpenUDID', '~> 1.0.0'
  s.dependencies =	pod 'Reachability', '~> 3.1.1'

end