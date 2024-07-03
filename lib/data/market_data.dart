import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing market data for a specific cryptocurrency.
class MarketData {
  /// The identifier of the coin.
  final String coinId;

  /// The current price of the coin.
  double? currentPrice;

  /// The market capitalization of the coin.
  double? marketCap;

  /// The total volume of the coin traded.
  double? totalVolume;

  /// The all-time high price of the coin.
  double? ath;

  /// The percentage change from the all-time high price.
  double? athChangePercentage;

  /// The date when the all-time high price was reached.
  DateTime? athDate;

  /// The all-time low price of the coin.
  double? atl;

  /// The percentage change from the all-time low price.
  double? atlChangePercentage;

  /// The date when the all-time low price was reached.
  DateTime? atlDate;

  /// The fully diluted valuation of the coin.
  double? fullyDilutedValuation;

  /// The highest price of the coin in the last 24 hours.
  double? high24h;

  /// The lowest price of the coin in the last 24 hours.
  double? low24h;

  /// The price change of the coin in the last 24 hours.
  double? priceChange24hInCurrency;

  /// The percentage price change of the coin in the last 1 hour.
  double? priceChangePercentage1hInCurrency;

  /// The percentage price change of the coin in the last 24 hours.
  double? priceChangePercentage24hInCurrency;

  /// The percentage price change of the coin in the last 7 days.
  double? priceChangePercentage7dInCurrency;

  /// The percentage price change of the coin in the last 14 days.
  double? priceChangePercentage14dInCurrency;

  /// The percentage price change of the coin in the last 30 days.
  double? priceChangePercentage30dInCurrency;

  /// The percentage price change of the coin in the last 60 days.
  double? priceChangePercentage60dInCurrency;

  /// The percentage price change of the coin in the last 200 days.
  double? priceChangePercentage200dInCurrency;

  /// The percentage price change of the coin in the last 1 year.
  double? priceChangePercentage1yInCurrency;

  /// The market capitalization change of the coin in the last 24 hours.
  double? marketCapChange24hInCurrency;

  /// The percentage market capitalization change of the coin in the last 24 hours.
  double? marketCapChangePercentage24hInCurrency;

  /// Constructs a [MarketData] instance.
  ///
  /// [coinId] is the identifier of the coin.
  /// Optional named parameters can be provided to initialize the respective fields.
  MarketData(
    this.coinId, {
    this.currentPrice,
    this.marketCap,
    this.totalVolume,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.fullyDilutedValuation,
    this.high24h,
    this.low24h,
    this.priceChange24hInCurrency,
    this.priceChangePercentage1hInCurrency,
    this.priceChangePercentage24hInCurrency,
    this.priceChangePercentage7dInCurrency,
    this.priceChangePercentage14dInCurrency,
    this.priceChangePercentage30dInCurrency,
    this.priceChangePercentage60dInCurrency,
    this.priceChangePercentage200dInCurrency,
    this.priceChangePercentage1yInCurrency,
    this.marketCapChange24hInCurrency,
    this.marketCapChangePercentage24hInCurrency,
  });

  /// Returns a string representation of the [MarketData] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(MarketData)}: coinId = $coinId';
  }
}
