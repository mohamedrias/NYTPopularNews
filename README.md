## New York Times Popular News App

- [About](#About)
- [Libraries Used](#libraries-used)
- [System Requirements](#requirements)
- [Key Components](#key-components)
- [Installation](#installation)
- [TODO](#todo)


## About
NYT News App demonstrates how to fetch the most popular articles from New York Times REST API.


## Libraries Used

- Alamofire
- ObjectMapper

## System Requirements

* XCode 7.3.1
* Swift 2.3 (Environment constraint for now - Will upgrade)
* Cocoapods
* Fastlane


## Functionalities

- Fetching the most popular articles
- Displaying the article details wiht image


## Key Components

- Network Operation for concurrent API Requests
- REST API Adapter for intercepting requests & responses
- Object Mapper for JSON parsing
- Generic loading indicator to show progress icon in any UIView
- MVC Architecture which displays clear separation of concern


## Installation

- Run `pod install`
- Open `'NYTPopularNews.xcworkspace'` file in XCode to run the app in simular or device.



## TODO

- Unit testing
- UI Testing
- Integrate with Snap, Gym and Sigh
- App Icon
- Reachability for checking internet connectivity
- Migrate code to Swift 3
- Fastlane setup for running the project




