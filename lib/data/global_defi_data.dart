import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Global DEFI data wrapper
class GlobalDefiData {
  /// DEFI market capitalization
  final double? defiMarketCap;

  /// Ethereum market capitalization
  final double? ethMarketCap;

  /// DEFI market capitalization
  final double? defiToEthRatio;

  /// Trading volume in 24 hours
  final double? tradingVolume24h;

  /// DEFI dominance
  final double? defiDominance;

  /// Top coin name
  final String? topCoinName;

  /// Top coin DEFI dominance
  final double? topCoinDefiDominance;

  GlobalDefiData.fromJson(Map<String, dynamic> json)
      : this.defiMarketCap = Convert.toDouble(json['defi_market_cap']) ?? 0,
        this.ethMarketCap = Convert.toDouble(json['eth_market_cap']) ?? 0,
        this.defiToEthRatio = Convert.toDouble(json['defi_to_eth_ratio']) ?? 0,
        this.tradingVolume24h =
            Convert.toDouble(json['trading_volume_24h']) ?? 0,
        this.defiDominance = Convert.toDouble(json['defi_dominance']) ?? 0,
        this.topCoinName = Convert.toNullableString(json['top_coin_name']),
        this.topCoinDefiDominance =
            Convert.toDouble(json['top_coin_defi_dominance']) ?? 0 {}

  @override
  String toString() {
    return '${Helpers.getTypeName(GlobalDefiData)}';
  }
}
