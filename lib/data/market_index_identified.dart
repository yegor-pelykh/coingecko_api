import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class MarketIndexIdentified {
  final String id;
  final String name;
  final String market;
  final double last;
  final bool? isMultiAssetComposite;

  MarketIndexIdentified.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.market = Convert.toNotNullableString(json['market'], ''),
        this.last = Convert.toDouble(json['last']) ?? 0,
        this.isMultiAssetComposite = Convert.toNullableBoolean(json['is_multi_asset_composite']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndexIdentified)}: id = $id, name = $name';
  }
}
