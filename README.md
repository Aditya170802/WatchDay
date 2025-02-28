# WatchDay - Movie & TV Show Discovery App

A SwiftUI-based iOS application that allows users to browse and discover movies and TV shows using the Watchmode API.

## Developer Experience & Reflections

### Introduction
This project implements a Movie & TV Show Discovery App using SwiftUI and the Watchmode API. The goal was to create a user-friendly interface that allows users to browse popular media content and view detailed information about each title.

### Features Implemented

- **Dual Content Type Display**: Successfully implemented a segmented control to toggle between Movies and TV Shows, allowing users to browse different content types within the same interface.

- **MVVM Architecture**: Applied a clean Model-View-ViewModel architecture throughout the app, with clear separation of concerns:
  - Models for data structure
  - ViewModels for business logic and state management
  - Views for user interface presentation

- **Concurrent API Calls**: Implemented Publishers.Zip from Combine framework to fetch movie and TV show data simultaneously, improving load performance.

- **Elegant Loading States**: Designed custom shimmer effects to provide visual feedback during data loading, enhancing the user experience.

- **Error Handling**: Implemented comprehensive error handling with user-friendly alerts to gracefully manage network failures and other exceptions.

- **Detail View**: Created a detailed media information screen that displays title, description, release date, and poster image for each selected item.

### Challenges Faced

1. **Shimmer Effect Implementation**: Creating an elegant, subtle shimmer effect proved challenging initially. The first implementation was too prominent and distracting. After several iterations, I achieved a more refined effect by adjusting opacity, animation timing, and gradient parameters.

2. **API Response Structure**: The Watchmode API requires two separate calls to get complete information. First to get a list of titles, then another call to fetch detailed information for each title. This required careful state management to prevent unnecessary API calls.

3. **Image Loading & Caching**: Implementing efficient image loading with proper placeholder handling required careful consideration of AsyncImage capabilities and limitations.

### Assumptions Made

1. **API Key Management**: For simplicity, I stored the API key directly in the code. In a production environment, a more secure approach would be necessary, such as using environment variables or a secure key management system.

2. **Error Messages**: I assumed that displaying the error's localized description would be sufficient for this demo. In a production app, I would implement more user-friendly error messages specific to different failure scenarios.

3. **UI Design**: I prioritized functionality over complex UI design elements, assuming that a clean, functional interface would meet the requirements for this assignment.

## Setup & Installation

### Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+
- Watchmode API Key


### Getting a Watchmode API Key

1. Visit [Watchmode API](https://api.watchmode.com/) and sign up for an account
2. Navigate to your dashboard and generate a new API key
3. Copy the API key and use it in the app

## Project Structure

- **Models**: Data structures used in the app
- **ViewModels**: Logic layer between views and data
- **Views**: UI components
- **Services**: Networking code

## API Usage

The app uses the following Watchmode API endpoints:

1. List titles: `https://api.watchmode.com/v1/list-titles?apiKey={apiKey}&types={type}`
2. Title details: `https://api.watchmode.com/v1/title/{id}/details/?apiKey={apiKey}&append_to_response=sources`
