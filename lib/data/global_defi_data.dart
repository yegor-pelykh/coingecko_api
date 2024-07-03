import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents global DEFI data.
class GlobalDefiData {
  /// The market capitalization of DEFI.
  final double? defiMarketCap;

  /// The market capitalization of Ethereum.
  final double? ethMarketCap;

  /// The ratio of DEFI market capitalization to Ethereum market capitalization.
  final double? defiToEthRatio;

  /// The trading volume in the last 24 hours.
  final double? tradingVolume24h;

  /// The dominance of DEFI in the market.
  final double? defiDominance;

  /// The name of the top coin in DEFI.
  final String? topCoinName;

  /// The dominance of the top coin in DEFI.
  final double? topCoinDefiDominance;

  /// Constructs a [GlobalDefiData] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the data to be converted.
  GlobalDefiData.fromJson(Map<String, dynamic> json)
      : this.defiMarketCap = Convert.toDouble(json['defi_market_cap'], 0),
        this.ethMarketCap = Convert.toDouble(json['eth_market_cap'], 0),
        this.defiToEthRatio = Convert.toDouble(json['defi_to_eth_ratio'], 0),
        this.tradingVolume24h = Convert.toDouble(json['trading_volume_24h'], 0),
        this.defiDominance = Convert.toDouble(json['defi_dominance'], 0),
        this.topCoinName = Convert.toStrN(json['top_coin_name']),
        this.topCoinDefiDominance =
            Convert.toDouble(json['top_coin_defi_dominance'], 0);

  /// Returns a string representation of the [GlobalDefiData] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(GlobalDefiData)}';
  }
}
