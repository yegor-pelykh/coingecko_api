import 'package:coingecko_api/helpers/helpers.dart';

class MarketChartData {
  DateTime date;
  double? price;
  double? marketCap;
  double? totalVolume;

  MarketChartData(
    this.date, {
    this.price,
    this.marketCap,
    this.totalVolume,
  }) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketChartData)}: date = $date';
  }
}
