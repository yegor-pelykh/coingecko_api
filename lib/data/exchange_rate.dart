import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing exchange rate data.
class ExchangeRate {
  /// The name of the exchange rate.
  final String name;

  /// The unit of the exchange rate.
  final String unit;

  /// The value of the exchange rate.
  final double value;

  /// The type of the exchange rate.
  final String type;

  /// Constructs an [ExchangeRate] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the exchange rate data.
  ExchangeRate.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.unit = Convert.toStr(json['unit'], ''),
        this.value = Convert.toDouble(json['value'], 0),
        this.type = Convert.toStr(json['type'], '');

  /// Returns a string representation of the [ExchangeRate] instance.
  ///
  /// The string contains the type name and the value and unit of the exchange rate.
  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeRate)}: value = $value, unit = $unit';
  }
}
