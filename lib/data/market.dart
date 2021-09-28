import 'package:coingecko_api/data/market_sparkline.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class Market {
  final String id;
  final String symbol;
  final String name;
  final String? image;
  final double? currentPrice;
  final double? marketCap;
  final int? marketCapRank;
  final double? fullyDilutedValuation;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final double? roi;
  final DateTime? lastUpdated;
  final MarketSparkline? sparklineIn7d;
  final double? priceChangePercentage1hInCurrency;
  final double? priceChangePercentage24hInCurrency;
  final double? priceChangePercentage7dInCurrency;
  final double? priceChangePercentage14dInCurrency;
  final double? priceChangePercentage30dInCurrency;
  final double? priceChangePercentage200dInCurrency;
  final double? priceChangePercentage1yInCurrency;

  Market.fromJson(Map<String, dynamic> json)
      : id = Convert.toNotNullableString(json['id'], ''),
        symbol = Convert.toNotNullableString(json['symbol'], ''),
        name = Convert.toNotNullableString(json['name'], ''),
        image = Convert.toNullableString(json['image']),
        currentPrice = Convert.toDouble(json['current_price']),
        marketCap = Convert.toDouble(json['market_cap']),
        marketCapRank = Convert.toInt(json['market_cap_rank']),
        fullyDilutedValuation = Convert.toDouble(json['fully_diluted_valuation']),
        totalVolume = Convert.toDouble(json['total_volume']),
        high24h = Convert.toDouble(json['high_24h']),
        low24h = Convert.toDouble(json['low_24h']),
        priceChange24h = Convert.toDouble(json['price_change_24h']),
        priceChangePercentage24h = Convert.toDouble(json['price_change_percentage_24h']),
        marketCapChange24h = Convert.toDouble(json['market_cap_change_24h']),
        marketCapChangePercentage24h = Convert.toDouble(json['market_cap_percentage_change_24h']),
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
            : null {}

  @override
  String toString() {
    return '${Helpers.getTypeName(Market)}: id = $id, symbol = $symbol, name = $name';
  }
}
