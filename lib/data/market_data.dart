import 'package:coingecko_api/helpers/helpers.dart';

/// Market data wrapper
class MarketData {
  /// Coin identifier
  final String coinId;

  /// Current price
  double? currentPrice;

  /// Market capitalization
  double? marketCap;

  /// Total volume
  double? totalVolume;

  /// All Time High
  double? ath;

  /// All Time High change percentage
  double? athChangePercentage;

  /// All Time High date
  DateTime? athDate;

  /// All Time Low
  double? atl;

  /// All Time Low change percentage
  double? atlChangePercentage;

  /// All Time Low date
  DateTime? atlDate;

  /// Fully Diluted Valuation
  double? fullyDilutedValuation;

  /// High in 24 hours
  double? high24h;

  /// Low in 24 hours
  double? low24h;

  /// Price change in currency in 24 hours
  double? priceChange24hInCurrency;

  /// Price change percentage in currency in 1 hour
  double? priceChangePercentage1hInCurrency;

  /// Price change percentage in currency in 24 hours
  double? priceChangePercentage24hInCurrency;

  /// Price change percentage in currency in 7 days
  double? priceChangePercentage7dInCurrency;

  /// Price change percentage in currency in 14 days
  double? priceChangePercentage14dInCurrency;

  /// Price change percentage in currency in 30 days
  double? priceChangePercentage30dInCurrency;

  /// Price change percentage in currency in 60 days
  double? priceChangePercentage60dInCurrency;

  /// Price change percentage in currency in 200 days
  double? priceChangePercentage200dInCurrency;

  /// Price change percentage in currency in 1 year
  double? priceChangePercentage1yInCurrency;

  /// Market capitalization change in currency in 24 hours
  double? marketCapChange24hInCurrency;

  /// Market capitalization change percentage in currency in 24 hours
  double? marketCapChangePercentage24hInCurrency;

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
  }) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketData)}: coinId = $coinId';
  }
}
