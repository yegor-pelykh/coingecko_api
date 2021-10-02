import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Market index data wrapper
class MarketIndexIdentified {
  /// Market index identifier
  final String id;

  /// Market index name
  final String name;

  /// Market name
  final String market;

  /// Market index last value
  final double last;

  /// Indicates if the index is multi asset composite
  final bool? isMultiAssetComposite;

  MarketIndexIdentified.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.market = Convert.toNotNullableString(json['market'], ''),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.isMultiAssetComposite =
            Convert.toNullableBoolean(json['is_multi_asset_composite']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndexIdentified)}: id = $id, name = $name';
  }
}
