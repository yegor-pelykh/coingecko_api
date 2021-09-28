import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class CoinShort {
  final String id;
  final String symbol;
  final String name;
  final Map<String, String>? platforms;

  CoinShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.platforms = Helpers.parseMapStringString(json['platforms']) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinShort)}: id = $id, symbol = $symbol, name = $name';
  }
}
