import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Global coin data wrapper
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

  GlobalCoinData.fromJson(Map<String, dynamic> json)
      : this.activeCryptocurrencies =
            Convert.toInt(json['active_cryptocurrencies']) ?? 0,
        this.upcomingIcos = Convert.toInt(json['upcoming_icos']),
        this.ongoingIcos = Convert.toInt(json['ongoing_icos']),
        this.endedIcos = Convert.toInt(json['ended_icos']),
        this.markets = Convert.toInt(json['markets']),
        this.totalMarketCap =
            Helpers.parseMapStringDouble(json['total_market_cap']),
        this.totalVolume = Helpers.parseMapStringDouble(json['total_volume']),
        this.marketCapPercentage =
            Helpers.parseMapStringDouble(json['market_cap_percentage']),
        this.marketCapChangePercentage24hUsd =
            Convert.toDouble(json['market_cap_change_percentage_24h_usd']),
        this.updatedAt = Convert.toDateTime(json['updated_at']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(GlobalCoinData)}';
  }
}
