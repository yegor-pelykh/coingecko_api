import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange rate data wrapper
class ExchangeRate {
  /// Exchange rate name
  final String name;

  /// Exchange rate unit
  final String unit;

  /// Exchange rate value
  final double value;

  /// Exchange rate type
  final String type;

  ExchangeRate.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toStr(json['name'], ''),
        this.unit = Convert.toStr(json['unit'], ''),
        this.value = Convert.toDouble(json['value'], 0),
        this.type = Convert.toStr(json['type'], '');

  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeRate)}: value = $value, unit = $unit';
  }
}
