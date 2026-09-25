# 7-Day Flutter UI Challenge

A 7-day Flutter challenge where I recreated modern mobile UI designs from Figma while learning Flutter fundamentals, responsive layouts, custom widgets, and custom painting.

## Project Overview

This challenge focused on building pixel-perfect Flutter interfaces by breaking complex designs into reusable widgets instead of relying on pre-built templates.

The project includes two major screens:

* Home Dashboard UI
* Workout Tracking UI

## Screens

### Home Dashboard

* Custom calendar section
* Weekly activity graph using `CustomPainter`
* Metric cards
* Responsive spacing and alignment
* Modern rounded card design

### Workout Screen

* Workout summary card
* Custom circular fitness gauge
* Exercise progress card
* Custom icons and badges
* Interactive navigation

## What I Learned

### Flutter Fundamentals

* Widget tree structure
* Stateless widgets
* Project organization
* Asset management
* Navigation between screens

### Layout & UI Design

* `Row`
* `Column`
* `Expanded`
* `Spacer`
* `Padding`
* `SizedBox`
* `Stack`
* `Align`

### Responsive Design

* Fixed vs flexible layouts
* Proper spacing techniques
* Border radius consistency
* Shadow adjustments
* Screen width constraints

### Reusable Widgets

Created reusable components such as:

* Workout Header
* Workout Summary
* Running Progress Card
* Exercise List Card
* Weekly Points Card
* Metric Card
* Calendar Section

### CustomPainter

One of the biggest learnings was using `CustomPainter` to build custom graphics.

Built:

* Smooth weekly line graph
* Multi-ring circular workout gauge
* Gradient arcs
* Custom highlighted graph point

### Styling

* Google Fonts integration
* Color theme management
* Centralized `AppColors`
* Consistent typography system

### Flutter Concepts Practiced

* `BoxDecoration`
* `BorderRadius`
* `BoxShadow`
* `CircularProgressIndicator`
* Custom painted paths
* Gradient painting
* Asset images
* Icons
* Theme organization

## Folder Structure

```text
lib/
├── screens/
├── widgets/
├── theme/
└── main.dart

assets/
└── icons/
```

## Packages Used

* `flutter`
* `google_fonts`

## Biggest Challenges

* Recreating the Figma circular workout gauge.
* Drawing a smooth custom activity graph.
* Matching spacing and alignment exactly.
* Making reusable widgets without breaking the layout.
* Maintaining consistent colors and typography.

## Outcome

This challenge helped me understand how to convert a Figma design into a Flutter application using reusable widgets, responsive layouts, and custom drawing techniques instead of relying on third-party UI builders.

## Future Improvements

* Add animations.
* Make the dashboard fully data-driven.
* Add state management.
* Improve responsiveness for tablets.
* Connect workout data to a backend.
* Add dark mode support.
* Improve accessibility.
