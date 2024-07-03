import 'package:coingecko_api/data/market_data.dart';
import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that encapsulates various market data for a cryptocurrency.
class CoinMarketData {
  /// A list of market data categorized by currency.
  final List<MarketData> dataByCurrency;

  /// The total value locked in the cryptocurrency.
  final double? totalValueLocked;

  /// The ratio of market capitalization to total value locked.
  final double? mcapToTvlRatio;

  /// The ratio of fully diluted valuation to total value locked.
  final double? fdvToTvlRatio;

  /// The return on investment, indicating the profitability or efficiency of the investment.
  final double? roi;

  /// The price change in the last 24 hours.
  final double? priceChange24h;

  /// The percentage price change in the last 24 hours.
  final double? priceChangePercentage24h;

  /// The percentage price change in the last 7 days.
  final double? priceChangePercentage7d;

  /// The percentage price change in the last 14 days.
  final double? priceChangePercentage14d;

  /// The percentage price change in the last 30 days.
  final double? priceChangePercentage30d;

  /// The percentage price change in the last 60 days.
  final double? priceChangePercentage60d;

  /// The percentage price change in the last 200 days.
  final double? priceChangePercentage200d;

  /// The percentage price change in the last year.
  final double? priceChangePercentage1y;

  /// The market capitalization change in the last 24 hours.
  final double? marketCapChange24h;

  /// The percentage market capitalization change in the last 24 hours.
  final double? marketCapChangePercentage24h;

  /// The total supply of the cryptocurrency.
  final double? totalSupply;

  /// The maximum supply of the cryptocurrency.
  final double? maxSupply;

  /// The circulating supply of the cryptocurrency.
  final double? circulatingSupply;

  /// The sparkline data for the last 7 days.
  final MarketSparkline? sparkline7d;

  /// The timestamp of the last update of the data.
  final DateTime? lastUpdated;

  /// Constructs a [CoinMarketData] instance from a JSON object.
  ///
  /// [json] is a map containing the key-value pairs of the data.
  CoinMarketData.fromJson(Map<String, dynamic> json)
      : this.dataByCurrency = Helpers.parseMarketData(json),
        this.totalValueLocked = Convert.toDoubleN(json['total_value_locked']),
        this.mcapToTvlRatio = Convert.toDoubleN(json['mcap_to_tvl_ratio']),
        this.fdvToTvlRatio = Convert.toDoubleN(json['fdv_to_tvl_ratio']),
        this.roi = Convert.toDoubleN(json['roi']),
        this.priceChange24h = Convert.toDoubleN(json['price_change_24h']),
        this.priceChangePercentage24h =
            Convert.toDoubleN(json['price_change_percentage_24h']),
        this.priceChangePercentage7d =
            Convert.toDoubleN(json['price_change_percentage_7d']),
        this.priceChangePercentage14d =
            Convert.toDoubleN(json['price_change_percentage_14d']),
        this.priceChangePercentage30d =
            Convert.toDoubleN(json['price_change_percentage_30d']),
        this.priceChangePercentage60d =
            Convert.toDoubleN(json['price_change_percentage_60d']),
        this.priceChangePercentage200d =
            Convert.toDoubleN(json['price_change_percentage_200d']),
        this.priceChangePercentage1y =
            Convert.toDoubleN(json['price_change_percentage_1y']),
        this.marketCapChange24h =
            Convert.toDoubleN(json['market_cap_change_24h']),
        this.marketCapChangePercentage24h =
            Convert.toDoubleN(json['market_cap_change_percentage_24h']),
        this.totalSupply = Convert.toDoubleN(json['total_supply']),
        this.maxSupply = Convert.toDoubleN(json['max_supply']),
        this.circulatingSupply = Convert.toDoubleN(json['circulating_supply']),
        this.sparkline7d = json.containsKey('sparkline_7d')
            ? MarketSparkline.fromJson(json['sparkline_7d'])
            : null,
        this.lastUpdated = Convert.toDateTimeN(json['last_updated']);

  /// Returns a string representation of the [CoinMarketData] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinMarketData)}';
  }
}
