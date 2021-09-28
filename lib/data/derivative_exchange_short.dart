import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class DerivativeExchangeShort {
  final String id;
  final String name;

  DerivativeExchangeShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(DerivativeExchangeShort)}: id = $id, name = $name';
  }
}
