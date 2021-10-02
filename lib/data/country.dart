import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Country data wrapper
class Country {
  /// Country code
  final String code;

  /// Country name
  final String? country;

  Country.fromJson(Map<String, dynamic> json)
      : this.country = Convert.toNullableString(json['country']),
        this.code = Convert.toNotNullableString(json['code'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Country)}: country = $country, code = $code';
  }
}
