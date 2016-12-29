platform :ios, '8.0'

target 'Alfred' do
  use_frameworks!

  # Networking
  pod 'Alamofire'               # https://github.com/Alamofire/Alamofire
    
  # Mapping
  pod 'AlamofireObjectMapper'   # https://github.com/tristanhimmelman/AlamofireObjectMapper

  # Promise
  pod 'PromiseKit'              # https://github.com/mxcl/PromiseKit

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
