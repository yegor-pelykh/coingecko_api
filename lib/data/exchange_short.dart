import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange data wrapper in short form
class ExchangeShort {
  /// Exchange identifier
  final String id;

  /// Exchange name
  final String name;

  /// Constructs an [ExchangeShort] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the exchange data.
  ExchangeShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], '');

  /// Returns a string representation of the [ExchangeShort] instance.
  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeShort)}: id = $id, name = $name';
  }
}
