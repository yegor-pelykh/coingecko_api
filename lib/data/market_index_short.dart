import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class MarketIndexShort {
  final String id;
  final String name;

  MarketIndexShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndexShort)}: id = $id, name = $name';
  }
}
