To release a new version:

- commit changes
- change version in `pubspec.yaml`
- run `git add -A ; git commit -m "chore: Release v[version]"`
- run `git tag v[version]`
- if `dashlog` is not installed, install: `flutter pub global activate dashlog`
- run `dashlog create`
- run `git add -A ; git commit -m "chore: Update CHANGELOG"`
- run `git push origin master --tags`
- run `dart pub publish`