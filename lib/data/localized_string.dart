import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that wraps localized string data.
class LocalizedString {
  /// The identifier for the localized string.
  final String id;

  /// A map containing translations of the string in various languages.
  final Map<String, String> translations;

  /// Parses the translations from a JSON map.
  ///
  /// Removes the 'id' key from the translations if it exists.
  ///
  /// [json] - The JSON map containing the translations.
  ///
  /// Returns a map of translations.
  static Map<String, String> _parseTranslations(Map<String, dynamic> json) {
    final translations = Convert.toMapOfStringStringN(json);
    if (translations != null) {
      translations.remove('id');
      return translations;
    }
    return {};
  }

  /// Constructs a [LocalizedString] instance from a JSON map.
  ///
  /// [json] - The JSON map containing the localized string data.
  LocalizedString.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.translations = _parseTranslations(json);

  /// Returns a string representation of the [LocalizedString] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(LocalizedString)}: id = $id';
  }
}
