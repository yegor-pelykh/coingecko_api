import 'package:coingecko_api/helpers/helpers.dart';

/// Market chart data wrapper
class MarketChartData {
  /// Date
  final DateTime date;

  /// Price
  double? price;

  /// Market capitalization
  double? marketCap;

  /// Total volume
  double? totalVolume;

  MarketChartData(
    this.date, {
    this.price,
    this.marketCap,
    this.totalVolume,
  });

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketChartData)}: date = $date';
  }
}
