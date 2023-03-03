To release a new version:

- commit changes
- run `git tag v[version]`
- change version in `pubspec.yaml`
- if `dashlog` is not installed, install: `flutter pub global activate dashlog`
- run `dashlog create`
- run `git add -A ; git commit -m "Release v[version]"`
- run `git push origin master`
- run `dart pub publish`