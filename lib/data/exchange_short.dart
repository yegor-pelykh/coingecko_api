import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange data wrapper in short form
class ExchangeShort {
  /// Exchange identifier
  final String id;

  /// Exchange name
  final String name;

  ExchangeShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], '');

  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeShort)}: id = $id, name = $name';
  }
}
