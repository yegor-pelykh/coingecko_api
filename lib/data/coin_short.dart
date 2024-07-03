import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a short form of coin data.
class CoinShort {
  /// The unique identifier of the coin.
  final String id;

  /// The symbol of the coin.
  final String symbol;

  /// The name of the coin.
  final String name;

  /// A map of platforms where the coin is available.
  final Map<String, String>? platforms;

  /// Constructs a [CoinShort] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the coin data.
  CoinShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.platforms = Convert.toMapOfStringStringN(json['platforms']);

  /// Returns a string representation of the [CoinShort] instance.
  ///
  /// The string contains the type name and the values of the [id], [symbol], and [name] fields.
  @override
  String toString() {
    return '${Helpers.getTypeName(CoinShort)}: id = $id, symbol = $symbol, name = $name';
  }
}
