# app06_preco_do_bitcoin

This repository contains a Flutter app that demonstrates the application of clean code principles to build a Bitcoin price tracker. The app fetches data from an external API to update the current value of Bitcoin.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure
The project follows a clean code architecture, which is organized into the following directories:

- lib: Contains the main codebase of the Flutter app.
  - features/bitcoin
    - data: Contains data-related classes such as repositories and data sources.
    - domain: Contains domain-related classes such as entities and use cases.
    - presentation: Contains presentation-related classes such as widgets and screens.
  - core: Contains utility classes and helper functions.
