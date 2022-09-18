import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin data wrapper in short form
class CoinShort {
  /// Coin identifier
  final String id;

  /// Coin symbol
  final String symbol;

  /// Coin name
  final String name;

  /// Platforms on which the coin is presented
  final Map<String, String>? platforms;

  CoinShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.platforms = Convert.toMapOfStringStringN(json['platforms']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinShort)}: id = $id, symbol = $symbol, name = $name';
  }
}
