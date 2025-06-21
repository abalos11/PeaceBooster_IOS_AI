target 'CEO' do
platform :ios, '13.0'
use_frameworks!

pod 'SwiftyUserDefaults'
pod 'UIColor_Hex_Swift', '~> 5.1.9'
pod 'CropViewController'
pod 'SwiftyGif'
pod 'Firebase/Analytics'
pod 'IQKeyboardManagerSwift'
pod 'IQKeyboardToolbarManager'
pod 'SideMenu', '~> 6.0'
#pod 'MBProgressHUD'
pod 'SDWebImage'
pod 'LanguageManager-iOS'

pod 'Firebase/Firestore'
pod 'CodableFirebase'

end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
