import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class GlobalDefiData {
  final double? defiMarketCap;
  final double? ethMarketCap;
  final double? defiToEthRatio;
  final double? tradingVolume24h;
  final double? defiDominance;
  final String? topCoinName;
  final double? topCoinDefiDominance;

  GlobalDefiData.fromJson(Map<String, dynamic> json)
      : this.defiMarketCap = Convert.toDouble(json['defi_market_cap']) ?? 0,
        this.ethMarketCap = Convert.toDouble(json['eth_market_cap']) ?? 0,
        this.defiToEthRatio = Convert.toDouble(json['defi_to_eth_ratio']) ?? 0,
        this.tradingVolume24h = Convert.toDouble(json['trading_volume_24h']) ?? 0,
        this.defiDominance = Convert.toDouble(json['defi_dominance']) ?? 0,
        this.topCoinName = Convert.toNullableString(json['top_coin_name']),
        this.topCoinDefiDominance = Convert.toDouble(json['top_coin_defi_dominance']) ?? 0 {}

  @override
  String toString() {
    return '${Helpers.getTypeName(GlobalDefiData)}';
  }
}
