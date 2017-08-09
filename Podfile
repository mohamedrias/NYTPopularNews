# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
inhibit_all_warnings!
ENV["COCOAPODS_DISABLE_STATS"] = "true"

target 'NYTPopularNews' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NYTPopularNews
    pod 'Alamofire', '3.5.0'
    pod 'ObjectMapper', '1.3'

  target 'NYTPopularNewsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NYTPopularNewsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'YES'
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end

def ignore_overriding_contains_swift(installer, framework_target)
    target = installer.aggregate_targets.find{|t| t.name == "Pods-#{framework_target}"}
    raise "failed to find #{framework_target} among: #{installer.aggregate_targets}" unless target
    target.xcconfigs.each_value do |config|
        config.attributes.delete('EMBEDDED_CONTENT_CONTAINS_SWIFT')
    end
end
