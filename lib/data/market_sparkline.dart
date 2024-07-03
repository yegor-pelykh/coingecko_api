import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class that represents market sparkline data.
class MarketSparkline {
  /// A list of prices in the sparkline.
  final List<double> price;

  /// Constructs a [MarketSparkline] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the sparkline data.
  MarketSparkline.fromJson(Map<String, dynamic> json)
      : this.price = Convert.toListOfDouble(json['price']);

  /// Returns a string representation of the [MarketSparkline] instance.
  ///
  /// This method overrides the default [toString] method to provide a custom
  /// string representation.
  @override
  String toString() {
    return '${Helpers.getTypeName(MarketSparkline)}';
  }
}
