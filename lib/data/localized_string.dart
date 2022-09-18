import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Localized string data wrapper
class LocalizedString {
  /// Localized string
  final String id;

  /// Translations
  final Map<String, String> translations;

  static Map<String, String> _parseTranslations(Map<String, dynamic> json) {
    final translations = Convert.toMapOfStringStringN(json);
    if (translations != null) {
      translations.remove('id');
      return translations;
    }
    return {};
  }

  LocalizedString.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.translations = _parseTranslations(json);

  @override
  String toString() {
    return '${Helpers.getTypeName(LocalizedString)}: id = $id';
  }
}
