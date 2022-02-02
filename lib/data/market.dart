import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Market data wrapper
class Market {
  /// Market identifier
  final String id;

  /// Market symbol
  final String symbol;

  /// Market name
  final String name;

  /// Market image
  final String? image;

  /// Current price
  final double? currentPrice;

  /// Market capitalization
  final double? marketCap;

  /// Market capitalization rank
  final int? marketCapRank;

  /// Fully Diluted Valuation
  final double? fullyDilutedValuation;

  /// Total volume
  final double? totalVolume;

  /// High in 24 hours
  final double? high24h;

  /// Low in 24 hours
  final double? low24h;

  /// Price change in 24 hours
  final double? priceChange24h;

  /// Price change percentage in 24 hours
  final double? priceChangePercentage24h;

  /// Market capitalization change in 24 hours
  final double? marketCapChange24h;

  /// Market capitalization change percentage in 24 hours
  final double? marketCapChangePercentage24h;

  /// Circulating supply
  final double? circulatingSupply;

  /// Total supply
  final double? totalSupply;

  /// Max supply
  final double? maxSupply;

  /// All Time High
  final double? ath;

  /// All Time High change percentage
  final double? athChangePercentage;

  /// All Time High date
  final DateTime? athDate;

  /// All Time Low
  final double? atl;

  /// All Time Low change percentage
  final double? atlChangePercentage;

  /// All Time Low date
  final DateTime? atlDate;

  /// Return On Investment (profitability or efficiency of investment)
  final double? roi;

  /// The moment at which the data was updated
  final DateTime? lastUpdated;

  /// Sparkline in 7 days
  final MarketSparkline? sparklineIn7d;

  /// Price change percentage in currency in 1 hour
  final double? priceChangePercentage1hInCurrency;

  /// Price change percentage in currency in 24 hours
  final double? priceChangePercentage24hInCurrency;

  /// Price change percentage in currency in 7 days
  final double? priceChangePercentage7dInCurrency;

  /// Price change percentage in currency in 14 days
  final double? priceChangePercentage14dInCurrency;

  /// Price change percentage in currency in 30 days
  final double? priceChangePercentage30dInCurrency;

  /// Price change percentage in currency in 200 days
  final double? priceChangePercentage200dInCurrency;

  /// Price change percentage in currency in 1 year
  final double? priceChangePercentage1yInCurrency;

  Market.fromJson(Map<String, dynamic> json)
      : id = Convert.toNotNullableString(json['id'], ''),
        symbol = Convert.toNotNullableString(json['symbol'], ''),
        name = Convert.toNotNullableString(json['name'], ''),
        image = Convert.toNullableString(json['image']),
        currentPrice = Convert.toDouble(json['current_price']),
        marketCap = Convert.toDouble(json['market_cap']),
        marketCapRank = Convert.toInt(json['market_cap_rank']),
        fullyDilutedValuation =
            Convert.toDouble(json['fully_diluted_valuation']),
        totalVolume = Convert.toDouble(json['total_volume']),
        high24h = Convert.toDouble(json['high_24h']),
        low24h = Convert.toDouble(json['low_24h']),
        priceChange24h = Convert.toDouble(json['price_change_24h']),
        priceChangePercentage24h =
            Convert.toDouble(json['price_change_percentage_24h']),
        marketCapChange24h = Convert.toDouble(json['market_cap_change_24h']),
        marketCapChangePercentage24h =
            Convert.toDouble(json['market_cap_percentage_change_24h']),
        circulatingSupply = Convert.toDouble(json['circulating_supply']),
        totalSupply = Convert.toDouble(json['total_supply']),
        maxSupply = Convert.toDouble(json['max_supply']),
        ath = Convert.toDouble(json['ath']),
        athChangePercentage = Convert.toDouble(json['ath_change_percentage']),
        athDate = Convert.toDateTime(json['ath_date']),
        atl = Convert.toDouble(json['atl']),
        lastUpdated = Convert.toDateTime(json['last_updated']),
        atlChangePercentage = Convert.toDouble(json['atl_change_percentage']),
        atlDate = Convert.toDateTime(json['atl_date']),
        roi = Convert.toDouble(json['roi']),
        priceChangePercentage1hInCurrency =
            Convert.toDouble(json['price_change_percentage_1h_in_currency']),
        priceChangePercentage24hInCurrency =
            Convert.toDouble(json['price_change_percentage_24h_in_currency']),
        priceChangePercentage7dInCurrency =
            Convert.toDouble(json['price_change_percentage_7d_in_currency']),
        priceChangePercentage14dInCurrency =
            Convert.toDouble(json['price_change_percentage_14d_in_currency']),
        priceChangePercentage30dInCurrency =
            Convert.toDouble(json['price_change_percentage_30d_in_currency']),
        priceChangePercentage200dInCurrency =
            Convert.toDouble(json['price_change_percentage_200d_in_currency']),
        priceChangePercentage1yInCurrency =
            Convert.toDouble(json['price_change_percentage_1y_in_currency']),
        this.sparklineIn7d = json.containsKey('sparkline_in_7d')
            ? MarketSparkline.fromJson(json['sparkline_in_7d'])
            : null;

  @override
  String toString() {
    return '${Helpers.getTypeName(Market)}: id = $id, symbol = $symbol, name = $name';
  }
}
