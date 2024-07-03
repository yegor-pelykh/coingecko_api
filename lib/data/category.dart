import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing a cryptocurrency category with various financial metrics.
class Category {
  /// The unique identifier for the category.
  final String id;

  /// The name of the category.
  final String name;

  /// The market capitalization of the category.
  final double marketCap;

  /// The change in market capitalization over the last 24 hours.
  final double marketCapChange24h;

  /// The trading volume of the category over the last 24 hours.
  final double volume24h;

  /// The timestamp when the data was last updated.
  final DateTime updatedAt;

  /// Constructs a [Category] instance from a JSON map.
  ///
  /// Parameters:
  /// - `json`: A map containing the category data.
  Category.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.marketCap = Convert.toDouble(json['market_cap'], 0),
        this.marketCapChange24h =
            Convert.toDouble(json['market_cap_change_24h'], 0),
        this.volume24h = Convert.toDouble(json['volume_24h'], 0),
        this.updatedAt =
            Convert.toDateTime(json['updated_at'], Helpers.defaultDateTime());

  /// Returns a string representation of the [Category] instance.
  ///
  /// The string contains the type name and the id and name of the category.
  @override
  String toString() {
    return '${Helpers.getTypeName(Category)}: id = $id, name = $name';
  }
}
