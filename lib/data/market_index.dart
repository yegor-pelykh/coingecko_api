import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Market index data wrapper
class MarketIndex {
  /// The name of the market index
  final String name;

  /// The name of the market
  final String market;

  /// The last value of the market index
  final double last;

  /// Indicates if the index is a multi-asset composite
  final bool? isMultiAssetComposite;

  /// Constructs a MarketIndex instance from a JSON map
  ///
  /// [json] is a map containing the data to initialize the MarketIndex
  MarketIndex.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.market = Convert.toStr(json['market'], ''),
        this.last = Convert.toDouble(json['last'], 0),
        this.isMultiAssetComposite =
            Convert.toBooleanN(json['is_multi_asset_composite']);

  /// Returns a string representation of the MarketIndex instance
  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndex)}: name = $name';
  }
}
