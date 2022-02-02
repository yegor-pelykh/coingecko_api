import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Category data wrapper
class Category {
  /// Category identifier
  final String id;

  /// Category name
  final String name;

  /// Market capitalization for category
  final double marketCap;

  /// Market capitalization change in 24 hours
  final double marketCapChange24h;

  /// Trading volume in 24 hours
  final double volume24h;

  /// The moment at which the data was updated
  final DateTime updatedAt;

  Category.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.marketCap = Convert.toDouble(json['market_cap']) ?? 0,
        this.marketCapChange24h =
            Convert.toDouble(json['market_cap_change_24h']) ?? 0,
        this.volume24h = Convert.toDouble(json['volume_24h']) ?? 0,
        this.updatedAt =
            Convert.toDateTime(json['updated_at']) ?? Helpers.defaultDateTime();

  @override
  String toString() {
    return '${Helpers.getTypeName(Category)}: id = $id, name = $name';
  }
}
