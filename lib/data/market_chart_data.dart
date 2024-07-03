import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents market chart data, including date, price, market capitalization, and total volume.
class MarketChartData {
  /// The date of the market data.
  final DateTime date;

  /// The price of the asset at the given date.
  double? price;

  /// The market capitalization of the asset at the given date.
  double? marketCap;

  /// The total volume of the asset traded at the given date.
  double? totalVolume;

  /// Constructs a [MarketChartData] instance with the given date and optional price, market capitalization, and total volume.
  ///
  /// [date] - The date of the market data.
  /// [price] - The price of the asset at the given date.
  /// [marketCap] - The market capitalization of the asset at the given date.
  /// [totalVolume] - The total volume of the asset traded at the given date.
  MarketChartData(
    this.date, {
    this.price,
    this.marketCap,
    this.totalVolume,
  });

  /// Returns a string representation of the [MarketChartData] instance.
  ///
  /// The string includes the type name and the date of the market data.
  @override
  String toString() {
    return '${Helpers.getTypeName(MarketChartData)}: date = $date';
  }
}
