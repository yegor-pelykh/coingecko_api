import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Category data wrapper in short form
class CategoryShort {
  /// Category identifier
  final String id;

  /// Category name
  final String name;

  CategoryShort.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['category_id'], ''),
        this.name = Convert.toNotNullableString(json['name'], '') {}

  @override
  String toString() {
    return '${Helpers.getTypeName(CategoryShort)}: id = $id, name = $name';
  }
}
