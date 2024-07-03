import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Market data wrapper class that holds various market-related information.
class Market {
  /// Market identifier.
  final String id;

  /// Market symbol.
  final String symbol;

  /// Market name.
  final String name;

  /// Market image URL.
  final String? image;

  /// Current price of the market.
  final double? currentPrice;

  /// Market capitalization.
  final double? marketCap;

  /// Market capitalization rank.
  final int? marketCapRank;

  /// Fully Diluted Valuation.
  final double? fullyDilutedValuation;

  /// Total volume of the market.
  final double? totalVolume;

  /// Highest price in the last 24 hours.
  final double? high24h;

  /// Lowest price in the last 24 hours.
  final double? low24h;

  /// Price change in the last 24 hours.
  final double? priceChange24h;

  /// Price change percentage in the last 24 hours.
  final double? priceChangePercentage24h;

  /// Market capitalization change in the last 24 hours.
  final double? marketCapChange24h;

  /// Market capitalization change percentage in the last 24 hours.
  final double? marketCapChangePercentage24h;

  /// Circulating supply of the market.
  final double? circulatingSupply;

  /// Total supply of the market.
  final double? totalSupply;

  /// Maximum supply of the market.
  final double? maxSupply;

  /// All Time High price.
  final double? ath;

  /// All Time High change percentage.
  final double? athChangePercentage;

  /// Date of All Time High.
  final DateTime? athDate;

  /// All Time Low price.
  final double? atl;

  /// All Time Low change percentage.
  final double? atlChangePercentage;

  /// Date of All Time Low.
  final DateTime? atlDate;

  /// Return On Investment (profitability or efficiency of investment).
  final double? roi;

  /// The moment at which the data was updated.
  final DateTime? lastUpdated;

  /// Sparkline data for the last 7 days.
  final MarketSparkline? sparklineIn7d;

  /// Price change percentage in currency in the last 1 hour.
  final double? priceChangePercentage1hInCurrency;

  /// Price change percentage in currency in the last 24 hours.
  final double? priceChangePercentage24hInCurrency;

  /// Price change percentage in currency in the last 7 days.
  final double? priceChangePercentage7dInCurrency;

  /// Price change percentage in currency in the last 14 days.
  final double? priceChangePercentage14dInCurrency;

  /// Price change percentage in currency in the last 30 days.
  final double? priceChangePercentage30dInCurrency;

  /// Price change percentage in currency in the last 200 days.
  final double? priceChangePercentage200dInCurrency;

  /// Price change percentage in currency in the last 1 year.
  final double? priceChangePercentage1yInCurrency;

  /// Constructs a Market instance from a JSON map.
  ///
  /// [json] is a map containing the market data.
  Market.fromJson(Map<String, dynamic> json)
      : id = Convert.toStr(json['id'], ''),
        symbol = Convert.toStr(json['symbol'], ''),
        name = Convert.toStr(json['name'], ''),
        image = Convert.toStrN(json['image']),
        currentPrice = Convert.toDoubleN(json['current_price']),
        marketCap = Convert.toDoubleN(json['market_cap']),
        marketCapRank = Convert.toIntN(json['market_cap_rank']),
        fullyDilutedValuation =
            Convert.toDoubleN(json['fully_diluted_valuation']),
        totalVolume = Convert.toDoubleN(json['total_volume']),
        high24h = Convert.toDoubleN(json['high_24h']),
        low24h = Convert.toDoubleN(json['low_24h']),
        priceChange24h = Convert.toDoubleN(json['price_change_24h']),
        priceChangePercentage24h =
            Convert.toDoubleN(json['price_change_percentage_24h']),
        marketCapChange24h = Convert.toDoubleN(json['market_cap_change_24h']),
        marketCapChangePercentage24h =
            Convert.toDoubleN(json['market_cap_percentage_change_24h']),
        circulatingSupply = Convert.toDoubleN(json['circulating_supply']),
        totalSupply = Convert.toDoubleN(json['total_supply']),
        maxSupply = Convert.toDoubleN(json['max_supply']),
        ath = Convert.toDoubleN(json['ath']),
        athChangePercentage = Convert.toDoubleN(json['ath_change_percentage']),
        athDate = Convert.toDateTimeN(json['ath_date']),
        atl = Convert.toDoubleN(json['atl']),
        lastUpdated = Convert.toDateTimeN(json['last_updated']),
        atlChangePercentage = Convert.toDoubleN(json['atl_change_percentage']),
        atlDate = Convert.toDateTimeN(json['atl_date']),
        roi = Convert.toDoubleN(json['roi']),
        priceChangePercentage1hInCurrency =
            Convert.toDoubleN(json['price_change_percentage_1h_in_currency']),
        priceChangePercentage24hInCurrency =
            Convert.toDoubleN(json['price_change_percentage_24h_in_currency']),
        priceChangePercentage7dInCurrency =
            Convert.toDoubleN(json['price_change_percentage_7d_in_currency']),
        priceChangePercentage14dInCurrency =
            Convert.toDoubleN(json['price_change_percentage_14d_in_currency']),
        priceChangePercentage30dInCurrency =
            Convert.toDoubleN(json['price_change_percentage_30d_in_currency']),
        priceChangePercentage200dInCurrency =
            Convert.toDoubleN(json['price_change_percentage_200d_in_currency']),
        priceChangePercentage1yInCurrency =
            Convert.toDoubleN(json['price_change_percentage_1y_in_currency']),
        this.sparklineIn7d = json.containsKey('sparkline_in_7d')
            ? MarketSparkline.fromJson(json['sparkline_in_7d'])
            : null;

  /// Returns a string representation of the Market instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(Market)}: id = $id, symbol = $symbol, name = $name';
  }
}
