cd packages/weappear_localizations
flutter gen-l10n
cd ../..
rm pubspec.lock
echo "Getting new localizations..."
flutter pub get