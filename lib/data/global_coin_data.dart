import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class GlobalCoinData {
  final int activeCryptocurrencies;
  final int? upcomingIcos;
  final int? ongoingIcos;
  final int? endedIcos;
  final int? markets;
  final Map<String, double>? totalMarketCap;
  final Map<String, double>? totalVolume;
  final Map<String, double>? marketCapPercentage;
  final double? marketCapChangePercentage24hUsd;
  final DateTime? updatedAt;

  GlobalCoinData.fromJson(Map<String, dynamic> json)
      : this.activeCryptocurrencies = Convert.toInt(json['active_cryptocurrencies']) ?? 0,
        this.upcomingIcos = Convert.toInt(json['upcoming_icos']),
        this.ongoingIcos = Convert.toInt(json['ongoing_icos']),
        this.endedIcos = Convert.toInt(json['ended_icos']),
        this.markets = Convert.toInt(json['markets']),
        this.totalMarketCap = Helpers.parseMapStringDouble(json['total_market_cap']),
        this.totalVolume = Helpers.parseMapStringDouble(json['total_volume']),
        this.marketCapPercentage = Helpers.parseMapStringDouble(json['market_cap_percentage']),
        this.marketCapChangePercentage24hUsd =
            Convert.toDouble(json['market_cap_change_percentage_24h_usd']),
        this.updatedAt = Convert.toDateTime(json['updated_at']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(GlobalCoinData)}';
  }
}
