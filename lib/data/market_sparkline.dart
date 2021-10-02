import 'package:coingecko_api/helpers/helpers.dart';

/// Market sparkline data wrapper
class MarketSparkline {
  /// List of prices
  final List<double> price;

  MarketSparkline.fromJson(Map<String, dynamic> json)
      : this.price = Helpers.parseListDouble(json['price']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(MarketSparkline)}';
  }
}
