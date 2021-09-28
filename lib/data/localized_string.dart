import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class LocalizedString {
  final String id;
  final Map<String, String> translations;

  static Map<String, String> _parseTranslations(Map<String, dynamic> json) {
    final translations = Helpers.parseMapStringString(json);
    if (translations != null) {
      translations.remove('id');
      return translations;
    }
    return {};
  }

  LocalizedString.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.translations = _parseTranslations(json) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(LocalizedString)}: id = $id';
  }
}
