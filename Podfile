 platform :ios, '10.0'

def shared_pods

pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'Firebase/Storage'
pod 'IQKeyboardManagerSwift'
pod 'CodableFirebase'
pod 'Kingfisher', '~> 4.0'

end

target 'artable' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

shared_pods
pod 'Stripe'
pod 'Alamofire'

end

target 'artableAdmin' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for artableAdmin
  shared_pods
  pod 'CropViewController'
  
  

end
