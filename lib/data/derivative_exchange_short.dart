import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a derivative exchange in short form.
class DerivativeExchangeShort {
  /// The unique identifier of the exchange.
  final String id;

  /// The name of the exchange.
  final String name;

  /// Constructs a [DerivativeExchangeShort] instance from a JSON object.
  ///
  /// Parameters:
  /// - [json]: A map containing the JSON data.
  DerivativeExchangeShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], '');

  /// Returns a string representation of the [DerivativeExchangeShort] instance.
  ///
  /// Returns:
  /// A string containing the type name and the values of the [id] and [name] fields.
  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeExchangeShort)}: id = $id, name = $name';
  }
}
