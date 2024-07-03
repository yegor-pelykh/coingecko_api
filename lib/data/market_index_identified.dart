import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing market index data.
class MarketIndexIdentified {
  /// The identifier of the market index.
  final String id;

  /// The name of the market index.
  final String name;

  /// The name of the market.
  final String market;

  /// The last value of the market index.
  final double last;

  /// Indicates if the index is a multi-asset composite.
  final bool? isMultiAssetComposite;

  /// Constructs a [MarketIndexIdentified] instance from a JSON map.
  ///
  /// Parameters:
  /// - [json]: A map containing the JSON data.
  MarketIndexIdentified.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.market = Convert.toStr(json['market'], ''),
        this.last = Convert.toDouble(json['last'], 0),
        this.isMultiAssetComposite =
            Convert.toBooleanN(json['is_multi_asset_composite']);

  /// Returns a string representation of the [MarketIndexIdentified] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndexIdentified)}: id = $id, name = $name';
  }
}
