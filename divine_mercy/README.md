# divine_mercy

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deploying a new version

- Under android/key.properties you must have the info related to the keystore to sign the app. The keystore itself is not in this repo for obvious security reasons.
- Increment the version in the pubspec.yaml
- Run this command: 
```
flutter build appbundle --release
```
- Upload this bundle to the playstore:
```
build/app/outputs/bundle/release/app-release.aab
```