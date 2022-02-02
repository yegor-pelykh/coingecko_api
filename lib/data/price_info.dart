import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Price info data wrapper
class PriceInfo {
  /// Price info data
  final Map<String, dynamic> _json;

  /// Price info identifier
  final String id;

  /// The moment at which the data was last updated
  final DateTime lastUpdatedAt;

  PriceInfo.fromJson(this.id, this._json)
      : this.lastUpdatedAt = Convert.toDateTime(_json['last_updated_at']) ??
            Helpers.defaultDateTime() {
    _json.remove('last_updated_at');
  }

  double? getPriceIn(String vsCurrency) {
    return Convert.toDouble(_json[vsCurrency.toLowerCase()]);
  }

  double? getMarketCapIn(String vsCurrency) {
    return Convert.toDouble(_json['${vsCurrency.toLowerCase()}_market_cap']);
  }

  double? get24hVolIn(String vsCurrency) {
    return Convert.toDouble(_json['${vsCurrency.toLowerCase()}_24h_vol']);
  }

  double? get24hChangeIn(String vsCurrency) {
    return Convert.toDouble(_json['${vsCurrency.toLowerCase()}_24h_change']);
  }

  @override
  String toString() {
    return '${Helpers.getTypeName(PriceInfo)}: id = $id';
  }
}
