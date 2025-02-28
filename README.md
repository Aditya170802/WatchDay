# WatchDay - Movie & TV Show Discovery App

A SwiftUI-based iOS application that allows users to browse and discover movies and TV shows using the Watchmode API.

## Features

- **Home Screen**:
  - Browse both movies and TV shows
  - Toggle between content types with a segmented control
  - Smooth scrolling with LazyVStack
  - Elegant loading states with shimmer effects

- **Details Screen**:
  - View comprehensive information about each title
  - See high-quality poster images
  - Read plot descriptions
  - Check release dates

- **Technical Implementation**:
  - MVVM architecture for clean separation of concerns
  - Combine framework with Publishers.Zip for concurrent API calls
  - Proper error handling with user-friendly alerts
  - Custom shimmer effects for loading states

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+
- Watchmode API Key


## Getting a Watchmode API Key

1. Visit [Watchmode API](https://api.watchmode.com/) and sign up for an account
2. Navigate to your dashboard and generate a new API key
3. Copy the API key and use it in the app


## API Usage

The app uses the following Watchmode API endpoints:

1. List titles: `https://api.watchmode.com/v1/list-titles?apiKey={apiKey}&types={type}`
2. Title details: `https://api.watchmode.com/v1/title/{id}/details/?apiKey={apiKey}&append_to_response=sources`


## Acknowledgements

- [Watchmode API](https://api.watchmode.com/) for providing the movie and TV show data
