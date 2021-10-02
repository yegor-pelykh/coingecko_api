import 'package:coingecko_api/data/market_data.dart';
import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin market data wrapper
class CoinMarketData {
  /// Market data by currency
  final List<MarketData> dataByCurrency;

  /// Total Value Locked
  final double? totalValueLocked;

  /// Market capitalization to TVL ratio
  final double? mcapToTvlRatio;

  /// Fully Diluted Valuation to TVL ratio
  final double? fdvToTvlRatio;

  /// Return On Investment (profitability or efficiency of investment)
  final double? roi;

  /// Price change in 24 hours
  final double? priceChange24h;

  /// Price change percentage in 24 hours
  final double? priceChangePercentage24h;

  /// Price change percentage in 7 days
  final double? priceChangePercentage7d;

  /// Price change percentage in 14 days
  final double? priceChangePercentage14d;

  /// Price change percentage in 30 days
  final double? priceChangePercentage30d;

  /// Price change percentage in 60 days
  final double? priceChangePercentage60d;

  /// Price change percentage in 200 days
  final double? priceChangePercentage200d;

  /// Price change percentage in 1 year
  final double? priceChangePercentage1y;

  /// Market capitalization change in 24 hours
  final double? marketCapChange24h;

  /// Market capitalization change percentage in 24 hours
  final double? marketCapChangePercentage24h;

  /// Total supply
  final double? totalSupply;

  /// Max supply
  final double? maxSupply;

  /// Circulating supply
  final double? circulatingSupply;

  /// Sparkline in 7 days
  final MarketSparkline? sparkline7d;

  /// The moment at which the data was last updated
  final DateTime? lastUpdated;

  CoinMarketData.fromJson(Map<String, dynamic> json)
      : this.dataByCurrency = Helpers.parseMarketData(json),
        this.totalValueLocked = Convert.toDouble(json['total_value_locked']),
        this.mcapToTvlRatio = Convert.toDouble(json['mcap_to_tvl_ratio']),
        this.fdvToTvlRatio = Convert.toDouble(json['fdv_to_tvl_ratio']),
        this.roi = Convert.toDouble(json['roi']),
        this.priceChange24h = Convert.toDouble(json['price_change_24h']),
        this.priceChangePercentage24h =
            Convert.toDouble(json['price_change_percentage_24h']),
        this.priceChangePercentage7d =
            Convert.toDouble(json['price_change_percentage_7d']),
        this.priceChangePercentage14d =
            Convert.toDouble(json['price_change_percentage_14d']),
        this.priceChangePercentage30d =
            Convert.toDouble(json['price_change_percentage_30d']),
        this.priceChangePercentage60d =
            Convert.toDouble(json['price_change_percentage_60d']),
        this.priceChangePercentage200d =
            Convert.toDouble(json['price_change_percentage_200d']),
        this.priceChangePercentage1y =
            Convert.toDouble(json['price_change_percentage_1y']),
        this.marketCapChange24h =
            Convert.toDouble(json['market_cap_change_24h']),
        this.marketCapChangePercentage24h =
            Convert.toDouble(json['market_cap_change_percentage_24h']),
        this.totalSupply = Convert.toDouble(json['total_supply']),
        this.maxSupply = Convert.toDouble(json['max_supply']),
        this.circulatingSupply = Convert.toDouble(json['circulating_supply']),
        this.sparkline7d = json.containsKey('sparkline_7d')
            ? MarketSparkline.fromJson(json['sparkline_7d'])
            : null,
        this.lastUpdated = Convert.toDateTime(json['last_updated']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinMarketData)}';
  }
}
