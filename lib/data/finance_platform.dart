import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Finance platform data wrapper
class FinancePlatform {
  /// Finance platform name
  final String name;

  /// Finance platform facts
  final String facts;

  /// Finance platform category
  final String category;

  /// Indicates if the finance platform is centralized
  final bool centralized;

  /// Finance platform website url
  final String websiteUrl;

  FinancePlatform.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.facts = Convert.toNotNullableString(json['facts'], ''),
        this.category = Convert.toNotNullableString(json['category'], ''),
        this.centralized =
            Convert.toNotNullableBoolean(json['centralized'], false),
        this.websiteUrl = Convert.toNotNullableString(json['website_url'], '');

  @override
  String toString() {
    return '${Helpers.getTypeName(FinancePlatform)}: name = $name, category = $category';
  }
}
