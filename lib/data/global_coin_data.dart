import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Global coin data wrapper
///
/// This class encapsulates various statistics and data points related to global cryptocurrency markets.
class GlobalCoinData {
  /// Number of active cryptocurrencies
  final int activeCryptocurrencies;

  /// Number of upcoming ICOs
  final int? upcomingIcos;

  /// Number of ongoing ICOs
  final int? ongoingIcos;

  /// Number of ended ICOs
  final int? endedIcos;

  /// Number of markets
  final int? markets;

  /// Total market capitalization by asset
  final Map<String, double>? totalMarketCap;

  /// Total volume by asset
  final Map<String, double>? totalVolume;

  /// Total market capitalization percentage by asset
  final Map<String, double>? marketCapPercentage;

  /// Market capitalization change percentage in USD in 24 hours
  final double? marketCapChangePercentage24hUsd;

  /// The moment at which the data was updated
  final DateTime? updatedAt;

  /// Constructs a [GlobalCoinData] instance from a JSON map.
  ///
  /// [json] is a map containing the data to be converted into a [GlobalCoinData] instance.
  GlobalCoinData.fromJson(Map<String, dynamic> json)
      : this.activeCryptocurrencies =
            Convert.toInt(json['active_cryptocurrencies'], 0),
        this.upcomingIcos = Convert.toIntN(json['upcoming_icos']),
        this.ongoingIcos = Convert.toIntN(json['ongoing_icos']),
        this.endedIcos = Convert.toIntN(json['ended_icos']),
        this.markets = Convert.toIntN(json['markets']),
        this.totalMarketCap =
            Convert.toMapOfStringDoubleN(json['total_market_cap']),
        this.totalVolume = Convert.toMapOfStringDoubleN(json['total_volume']),
        this.marketCapPercentage =
            Convert.toMapOfStringDoubleN(json['market_cap_percentage']),
        this.marketCapChangePercentage24hUsd =
            Convert.toDoubleN(json['market_cap_change_percentage_24h_usd']),
        this.updatedAt = Convert.toDateTimeN(json['updated_at']);

  /// Returns a string representation of the [GlobalCoinData] instance.
  ///
  /// This method overrides the default [toString] method to provide a more meaningful string representation.
  @override
  String toString() {
    return '${Helpers.getTypeName(GlobalCoinData)}';
  }
}
