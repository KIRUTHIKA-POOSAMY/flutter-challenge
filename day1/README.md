##7-Day Flutter Challenge — Day 1

This repository contains my Day 1 implementation of the 7-Day Flutter UI Challenge, 
focusing on building a clean, modern mobile dashboard header.

## What I Did

* Built the Profile Section:
  Created a customized circular user avatar that loads an image online and displays a fallback user icon if the internet fails or the link breaks.
* Added Personalized Greeting:
   Placed the user's name ("Hello Sophia") right next to the profile photo using clean layout alignment.
* Designed a Notification Bell with Badge:
  Designed a circular white action button containing a bell icon and a small red badge dot to represent unread notifications.
* Constructed Month and Year Controls:
   Implemented a navigation bar showing `< Feb 2025 >` inside a soft-toned capsule pill container.
* Structured Safe Mobile Spacing:
  Wrapped the entire screen in `SafeArea` and consistent padding so the design doesn't get cut off by phone notches or system status bars.

## What I Learnt

* Layering Elements with `Stack`:
   Learned how to place one widget on top of another using `Stack` and `Positioned`, which made adding the red dot over the notification bell simple.
* Handling Network Images Safely:
   Learned to use `Image.network` along with `errorBuilder` to prevent the app from crashing or leaving an empty gap when images cannot load.
* Mastering UI Spacing with `Row` and `Column`:
   Gained hands-on experience combining `Row` (horizontal) and `Column` (vertical) layouts with `MainAxisAlignment.spaceBetween` to keep elements balanced across the screen.
* Styling Containers and Shapes:
   Practiced using `BoxDecoration`, `BoxShape.circle`, `BorderRadius`, and subtle `BoxShadow` to achieve a clean aesthetic without needing external UI packages.
* Mobile-First Layout Principles:
   Understood how Flutter widgets automatically scale to fit real mobile screen sizes while maintaining proper proportions.

## Tech Stack

* Framework: Flutter
* Language: Dart
