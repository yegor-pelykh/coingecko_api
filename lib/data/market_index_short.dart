import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a market index in short form.
class MarketIndexShort {
  /// The unique identifier of the market index.
  final String id;

  /// The name of the market index.
  final String name;

  /// Constructs a [MarketIndexShort] instance from a JSON map.
  ///
  /// The [json] parameter is a map containing the data to initialize the instance.
  MarketIndexShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], '');

  /// Returns a string representation of the [MarketIndexShort] instance.
  ///
  /// The string contains the type name and the values of the [id] and [name] fields.
  @override
  String toString() {
    return '${Helpers.getTypeName(MarketIndexShort)}: id = $id, name = $name';
  }
}
