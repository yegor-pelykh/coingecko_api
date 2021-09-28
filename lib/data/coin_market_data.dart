import 'package:coingecko_api/data/market_data.dart';
import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class CoinMarketData {
  final List<MarketData> dataByCurrency;
  final double? totalValueLocked;
  final double? mcapToTvlRatio;
  final double? fdvToTvlRatio;
  final double? roi;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? priceChangePercentage7d;
  final double? priceChangePercentage14d;
  final double? priceChangePercentage30d;
  final double? priceChangePercentage60d;
  final double? priceChangePercentage200d;
  final double? priceChangePercentage1y;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? totalSupply;
  final double? maxSupply;
  final double? circulatingSupply;
  final MarketSparkline? sparkline7d;
  final DateTime? lastUpdated;

  CoinMarketData.fromJson(Map<String, dynamic> json)
      : this.dataByCurrency = Helpers.parseMarketData(json),
        this.totalValueLocked = Convert.toDouble(json['total_value_locked']),
        this.mcapToTvlRatio = Convert.toDouble(json['mcap_to_tvl_ratio']),
        this.fdvToTvlRatio = Convert.toDouble(json['fdv_to_tvl_ratio']),
        this.roi = Convert.toDouble(json['roi']),
        this.priceChange24h = Convert.toDouble(json['price_change_24h']),
        this.priceChangePercentage24h = Convert.toDouble(json['price_change_percentage_24h']),
        this.priceChangePercentage7d = Convert.toDouble(json['price_change_percentage_7d']),
        this.priceChangePercentage14d = Convert.toDouble(json['price_change_percentage_14d']),
        this.priceChangePercentage30d = Convert.toDouble(json['price_change_percentage_30d']),
        this.priceChangePercentage60d = Convert.toDouble(json['price_change_percentage_60d']),
        this.priceChangePercentage200d = Convert.toDouble(json['price_change_percentage_200d']),
        this.priceChangePercentage1y = Convert.toDouble(json['price_change_percentage_1y']),
        this.marketCapChange24h = Convert.toDouble(json['market_cap_change_24h']),
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
