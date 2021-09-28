import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class PriceInfo {
  final String id;
  final Map<String, dynamic> json;
  final DateTime lastUpdatedAt;

  PriceInfo.fromJson(this.id, this.json)
      : this.lastUpdatedAt =
            Convert.toDateTime(json['last_updated_at']) ?? Helpers.defaultDateTime() {
    json.remove('last_updated_at');
  }

  double? getPriceIn(String vsCurrency) {
    return Convert.toDouble(json[vsCurrency.toLowerCase()]);
  }

  double? getMarketCapIn(String vsCurrency) {
    return Convert.toDouble(json['${vsCurrency.toLowerCase()}_market_cap']);
  }

  double? get24hVolIn(String vsCurrency) {
    return Convert.toDouble(json['${vsCurrency.toLowerCase()}_24h_vol']);
  }

  double? get24hChangeIn(String vsCurrency) {
    return Convert.toDouble(json['${vsCurrency.toLowerCase()}_24h_change']);
  }

  @override
  String toString() {
    return '${Helpers.getTypeName(PriceInfo)}: id = ${id}';
  }
}
