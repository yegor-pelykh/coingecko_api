import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that wraps price information data.
class PriceInfo {
  /// A map containing the price information data.
  final Map<String, dynamic> _json;

  /// The identifier for the price information.
  final String id;

  /// The timestamp indicating when the data was last updated.
  final DateTime lastUpdatedAt;

  /// Constructs a [PriceInfo] instance from a JSON object.
  ///
  /// The [id] parameter is the identifier for the price information.
  /// The [_json] parameter is a map containing the price information data.
  PriceInfo.fromJson(this.id, this._json)
      : this.lastUpdatedAt = Convert.toDateTime(
            _json['last_updated_at'], Helpers.defaultDateTime()) {
    _json.remove('last_updated_at');
  }

  /// Returns the price in the specified [vsCurrency].
  ///
  /// The [vsCurrency] parameter is the currency in which the price is requested.
  double? getPriceIn(String vsCurrency) {
    return Convert.toDoubleN(_json[vsCurrency.toLowerCase()]);
  }

  /// Returns the market cap in the specified [vsCurrency].
  ///
  /// The [vsCurrency] parameter is the currency in which the market cap is requested.
  double? getMarketCapIn(String vsCurrency) {
    return Convert.toDoubleN(_json['${vsCurrency.toLowerCase()}_market_cap']);
  }

  /// Returns the 24-hour volume in the specified [vsCurrency].
  ///
  /// The [vsCurrency] parameter is the currency in which the 24-hour volume is requested.
  double? get24hVolIn(String vsCurrency) {
    return Convert.toDoubleN(_json['${vsCurrency.toLowerCase()}_24h_vol']);
  }

  /// Returns the 24-hour change in the specified [vsCurrency].
  ///
  /// The [vsCurrency] parameter is the currency in which the 24-hour change is requested.
  double? get24hChangeIn(String vsCurrency) {
    return Convert.toDoubleN(_json['${vsCurrency.toLowerCase()}_24h_change']);
  }

  /// Returns a string representation of the [PriceInfo] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(PriceInfo)}: id = $id';
  }
}
