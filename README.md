# GetYourGuide Programming Challenge - Reviews App

This project was made as a solution to a programming challenge presented by GetYourGuide GmbH. The app is very simple, with most of its functionality included in a single view. Its main features are:
- Displays user defined number of reviews in its main screen and (TODO) allows the user to sort and filter based on some criteria
- Allows the user to post a new review

## Getting Started

- Clone the project to a local machine
- Run `pod install` as the project uses cocoapods to integrate `SwiftyJSON`
NOTE: Alternatvely, switch to the `PodsIncluded` branch if you want to skip installing
- Open `GYGReviews.xcworkspace`
- Use ``GYGReviews` scheme to build for desired device

### Prerequisites
- XCode 9.x.x
- CocoaPods 1.5.x
```
brew install cocoapods
```

## Miscelleneous Notes
- You will notice that in the edit view (where the user selects filters and sorting options), there is the possiblity to implement more filters if there were more information about the API. For the moment, however, only filtering on a particular rating is possible.
- The app works when the device is not connected to the internet also, however, it does not store any information from the previous session so the display will be empty on a fresh start.

## TODOs
- On tapping a review, it is displayed in a new, full screen
- Better error notification to user
- Unit testing 
- Factor out network request configurations to another class
- Implement more sort and filter criteria
