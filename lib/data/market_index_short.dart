import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Market index data wrapper in short form
class MarketIndexShort {
  /// Market index identifier
  final String id;

  /// Market index name
  final String name;

  MarketIndexShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], '');

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndexShort)}: id = $id, name = $name';
  }
}
