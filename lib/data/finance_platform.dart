import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class FinancePlatform {
  final String name;
  final String facts;
  final String category;
  final bool centralized;
  final String websiteUrl;

  FinancePlatform.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.facts = Convert.toNotNullableString(json['facts'], ''),
        this.category = Convert.toNotNullableString(json['category'], ''),
        this.centralized = Convert.toNotNullableBoolean(json['centralized'], false),
        this.websiteUrl = Convert.toNotNullableString(json['website_url'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(FinancePlatform)}: name = $name, category = $category';
  }
}
