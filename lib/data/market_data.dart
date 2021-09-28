import 'package:coingecko_api/helpers/helpers.dart';

class MarketData {
  final String coinId;
  double? currentPrice;
  double? marketCap;
  double? totalVolume;
  double? ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  double? fullyDilutedValuation;
  double? high24h;
  double? low24h;
  double? priceChange24hInCurrency;
  double? priceChangePercentage1hInCurrency;
  double? priceChangePercentage24hInCurrency;
  double? priceChangePercentage7dInCurrency;
  double? priceChangePercentage14dInCurrency;
  double? priceChangePercentage30dInCurrency;
  double? priceChangePercentage60dInCurrency;
  double? priceChangePercentage200dInCurrency;
  double? priceChangePercentage1yInCurrency;
  double? marketCapChange24hInCurrency;
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
