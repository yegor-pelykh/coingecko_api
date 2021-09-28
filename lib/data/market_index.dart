import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class MarketIndex {
  final String name;
  final String market;
  final double last;
  final bool? isMultiAssetComposite;

  MarketIndex.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.market = Convert.toNotNullableString(json['market'], ''),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.isMultiAssetComposite = Convert.toNullableBoolean(json['is_multi_asset_composite']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndex)}: name = $name';
  }
}
