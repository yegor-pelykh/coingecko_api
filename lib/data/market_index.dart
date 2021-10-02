import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Market index data wrapper
class MarketIndex {
  /// Market index name
  final String name;

  /// Market name
  final String market;

  /// Market index last value
  final double last;

  /// Indicates if the index is multi asset composite
  final bool? isMultiAssetComposite;

  MarketIndex.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.market = Convert.toNotNullableString(json['market'], ''),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.isMultiAssetComposite =
            Convert.toNullableBoolean(json['is_multi_asset_composite']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndex)}: name = $name';
  }
}
