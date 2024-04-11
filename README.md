# Squadformers Takehome Article Project
- This is Shayne Torres' submission for the Squadformers takehome project

## Requirements:
- Xcode 15.2
- iOS 17.2

## Installation Steps
- Download from github
- Open project
- Build and run on a designated simulator

## Details
- I completed this project in just over an hour
- Due to the short nature of this project I focused mainly on how I would architect a view like this in a larger project
    - Modular, generic, and reusable util classes: I made the main APIClient class as a generic to be extneded to any future use of an API. Given more time I would extend further with protocols to make it more testable. That way we can introduce mock api classes and test for specific use cases
    - Articles: I like to break up my views into the view and view model, following a MVVM aproach to app architecture. The view model holds the data and is responsible for responding to app events and user input. Given more time we could discuss a more robust implementation of MVVM where each object is responsible for certain types of actions (data fetching, user navigationm etc). The view model also includes multiple test initalizers for testing specific use cases. You can test the views to each view state in the SwiftUI preview window for ArticlesListView.swift
    - ViewState: I think it is important to define the different anticipated states a view can end up in and design UI for those. The viewState property on the viewModel allows for this so that we can enumerate and define behavior for very specific states. This also helps in handling unknown cases that could occur.
    - Testing: Due to the short nature of this small project I did not include any test cases but I did set everything up so that it would be easily testable. All objects an be mocked and have data injected into them to force certain states and test I/O of logic flows. Given more time and a more robust feature I would design the test cases first and then utitlizing the reusablility and mockability of the classes to test for different cases

